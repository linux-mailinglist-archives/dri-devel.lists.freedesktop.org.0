Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AA82F7862
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 13:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22FE89E8C;
	Fri, 15 Jan 2021 12:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9E989F8B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 12:14:04 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ke15so5310394ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 04:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=NmLUgYaHpMmp/Glo96D9DEqQ/Yh5CY5Lmv1h5AA+qJo=;
 b=WnipU97hNTzOGBfaZoLJB0x6SPjVZc75MSWC91u00qtgTm0HW+QrczgdqeEShC3xC2
 cSKxVVuaEyfdzmtHu0eRDbaXDDaiTBczdRLpb5PPERrD/ifPrz6CsQa35eTJr3do3nip
 lF3lrUtIR0kgYJudVLUqO88ll1giyjoTm6wI9cdgSHKS02M0NnsEGBiqTLrYzZhaA+44
 LkNug9yyKtzsTvWwYbq6XGn2l3nPKWOjniu29dP+9U7Qlf/2VQYg7LGVHSsJkIqM/bXP
 pZObIuVRtoYNA+e10EOUSxlIQXixF4TJO4C1+GhR0wxi8thSi6xhhHLrQ3rtDlE+7RwJ
 A7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NmLUgYaHpMmp/Glo96D9DEqQ/Yh5CY5Lmv1h5AA+qJo=;
 b=NV65v6VGpuAIJ6RFNg7m0Q2REJvCLjRd8O8QmsoP7v6W01miUJ+P5L91XF5AhSDZ+v
 K1Yel74zNPtVH9iC85V30L50ELTVquxqJfmX66eG/vUDQc+vvc8W8sop0Rj4HPvQTtbG
 U+1FdH1QgPjJbRmJNcIveIUc8+iZJnHCAxX64ZIcXckIrl1oGZMp1DbCALCHI91S5CxA
 wyFD3NxTuxv17eujn7JUsvOCi2VKLrSK+XR2Ko2I2+QBMZ4decdAArzgHOp4xVD345k5
 8bXS3WfsoZE/LAgE/0VqtnGY1jVXpJlrypfyxeCQedtAs4iFVIqjGCz6RA5HQZosePLc
 KSjg==
X-Gm-Message-State: AOAM531fzgI5J1flVRi3OKDxrvOra48SpIHjKaYXk/abYEvT4yKu1qAd
 5efByVV+TLTHbrom6U7LPC5CsgdN7gI=
X-Google-Smtp-Source: ABdhPJxJLN+rAxeVqK15rjoXb5xEGeGnjic3ZArS2klhLPLiLK/NtFEqytdA4vghl3rfcvnjG1EzJA==
X-Received: by 2002:a17:907:2061:: with SMTP id
 qp1mr8207366ejb.222.1610712843242; 
 Fri, 15 Jan 2021 04:14:03 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r7sm3277080ejo.20.2021.01.15.04.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 04:14:02 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: stop using GFP_TRANSHUGE_LIGHT
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: hdegoede@redhat.com, ray.huang@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20210113131325.223511-1-christian.koenig@amd.com>
Message-ID: <75cd4fa9-b359-dd32-c50d-d291687066a5@gmail.com>
Date: Fri, 15 Jan 2021 13:14:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113131325.223511-1-christian.koenig@amd.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGFucyBkbyB5b3UgaGF2ZSBhbnkgbW9yZSBjb21tZW50cyBvciBhIHRlc3RlZC1ieT8KCk90aGVy
d2lzZSBJIHB1c2ggaXQgdG8gZHJtLW1pc2MtZml4ZXMgdG9kYXkuCgpUaGFua3MsCkNocmlzdGlh
bi4KCkFtIDEzLjAxLjIxIHVtIDE0OjEzIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiBUaGUg
b25seSBmbGFnIHdlIHJlYWxseSBuZWVkIGlzIF9fR0ZQX05PTUVNQUxMT0MsIGhpZ2htZW0gZGVw
ZW5kcyBvbgo+IGRtYTMyIGFuZCBtb3ZlYWJsZS9jb21wb3VuZCBzaG91bGQgbmV2ZXIgYmUgc2V0
IGluIHRoZSBmaXJzdCBwbGFjZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3Bvb2wuYyB8IDExICsrKysrKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+IGluZGV4IDhj
ZDc3NmFkYzU5Mi4uMTFlMDMxM2RiMGVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3Bvb2wuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+IEBA
IC03OSwxMiArNzksMTMgQEAgc3RhdGljIHN0cnVjdCBwYWdlICp0dG1fcG9vbF9hbGxvY19wYWdl
KHN0cnVjdCB0dG1fcG9vbCAqcG9vbCwgZ2ZwX3QgZ2ZwX2ZsYWdzLAo+ICAgCXN0cnVjdCBwYWdl
ICpwOwo+ICAgCXZvaWQgKnZhZGRyOwo+ICAgCj4gLQlpZiAob3JkZXIpIHsKPiAtCQlnZnBfZmxh
Z3MgfD0gR0ZQX1RSQU5TSFVHRV9MSUdIVCB8IF9fR0ZQX05PUkVUUlkgfAo+ICsJLyogRG9uJ3Qg
c2V0IHRoZSBfX0dGUF9DT01QIGZsYWcgZm9yIGhpZ2hlciBvcmRlciBhbGxvY2F0aW9ucy4KPiAr
CSAqIE1hcHBpbmcgcGFnZXMgZGlyZWN0bHkgaW50byBhbiB1c2Vyc3BhY2UgcHJvY2VzcyBhbmQg
Y2FsbGluZwo+ICsJICogcHV0X3BhZ2UoKSBvbiBhIFRUTSBhbGxvY2F0ZWQgcGFnZSBpcyBpbGxl
Z2FsLgo+ICsJICovCj4gKwlpZiAob3JkZXIpCj4gKwkJZ2ZwX2ZsYWdzIHw9IF9fR0ZQX05PTUVN
QUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKPiAgIAkJCV9fR0ZQX0tTV0FQRF9SRUNMQUlNOwo+IC0J
CWdmcF9mbGFncyAmPSB+X19HRlBfTU9WQUJMRTsKPiAtCQlnZnBfZmxhZ3MgJj0gfl9fR0ZQX0NP
TVA7Cj4gLQl9Cj4gICAKPiAgIAlpZiAoIXBvb2wtPnVzZV9kbWFfYWxsb2MpIHsKPiAgIAkJcCA9
IGFsbG9jX3BhZ2VzKGdmcF9mbGFncywgb3JkZXIpOwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
