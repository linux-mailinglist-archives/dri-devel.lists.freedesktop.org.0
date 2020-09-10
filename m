Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2D3265CCA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124C76E3B0;
	Fri, 11 Sep 2020 09:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C146E249
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 22:09:44 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z19so4442965lfr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 15:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vg6m1Dp8b5XLKvFQ8jfS/reWQnW1RmWz2NuJau7dp7A=;
 b=e1bd/TxP6zwnW0PdTgJTO1Cp3zCufWPLaHx9xD2dWVl6yMqcx1nJWV2+Ou0GmVPrUx
 R7oEfVIo0BrqAnPzIPkwuSrKNYq4hZm/sWQ7kAqFOKTY0We9pD8RqUDDxzukTR3VfMbD
 PE3fPEaMyNNy8S4xxSeyYYdgkQE3rrSy99MxXiOsDRRSnP9hqoeKp4y4T3yGCJhkuZjo
 pY0KK50uRFjfJyh9lm+Cy8pdlHzIq1m8gP6VcbS+ZWEsg3Rwgo+eIi+RWllxsHzbKDpg
 weKZBSX2KzM0jMoFrUbAwlw6Hjad/2+l4XnDYbs5o4F5HEd9JFadZE/UuLQR8MIxkL+T
 //yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vg6m1Dp8b5XLKvFQ8jfS/reWQnW1RmWz2NuJau7dp7A=;
 b=O7SI8SIWAqi0dVok7Y65RPG/v0a2kSPgoDlQfkMQ8mhCFtsRH3bcDYRXew98kKVWio
 yDq1YoVbZ8oBN0FUUnsfPR3265MVnQGV8W8ojH0CFKmfiOqATL1UcxLJREq1yUsb75Ik
 ZXTEtzWK0dNYIdUsyzq0aVJg7lja+CmWVMXTvv35a4pVEb1upj/iJ6dlUGS3PEOVl4YQ
 wCP7U0MIWqcLh8u8dSqzB47eBS/AqPT4CPr3EWFerbtEjlyttGaM2Yj8GBeiGSQ9IVbU
 nnlRfeKVQ67gbGyRZIkZEhh76r7GvYwuov6B8PUE29BdDKiFPr5w78kQ7B02Td+jcoDm
 QFMg==
X-Gm-Message-State: AOAM532JZZlovRj5fk8hiETne9AB6zgtcF0Vnlj1LZa5Xh0izRY5aXz0
 /tIN6bzuUm0UpFruXAi+bPw=
X-Google-Smtp-Source: ABdhPJx/4CqhC5R9BvAl9DpGdk1FYGTliLAbf4Pl12nZWA+WI/WZmmrQXjlg+aVC9i1PivjU0QF3Cw==
X-Received: by 2002:a19:42c4:: with SMTP id p187mr5226615lfa.149.1599775782656; 
 Thu, 10 Sep 2020 15:09:42 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id h27sm23975lfj.87.2020.09.10.15.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 15:09:42 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <241b35d2-7033-7744-18bf-7065016ae1f8@gmail.com>
 <81c4020b-38d5-b94b-5919-b988341aee72@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4f01491-55af-73d3-f39f-bd8d2149795e@gmail.com>
Date: Fri, 11 Sep 2020 01:09:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <81c4020b-38d5-b94b-5919-b988341aee72@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMDkuMjAyMCAxMTo0MCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gOS85LzIw
IDI6MzYgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDUuMDkuMjAyMCAxMzozNCwgTWlr
a28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+PiBIaSBhbGwsCj4+Pgo+Pj4gaGVyZSdzIGEgc2Vj
b25kIHJldmlzaW9uIG9mIHRoZSBIb3N0MXgvVGVncmFEUk0gVUFQSSBwcm9wb3NhbCwKPj4+IGhv
cGVmdWxseSB3aXRoIG1vc3QgaXNzdWVzIGZyb20gdjEgcmVzb2x2ZWQsIGFuZCBhbHNvIHdpdGgK
Pj4+IGFuIGltcGxlbWVudGF0aW9uLiBUaGVyZSBhcmUgc3RpbGwgb3BlbiBpc3N1ZXMgd2l0aCB0
aGUKPj4+IGltcGxlbWVudGF0aW9uOgo+PiBDb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkgdGhlIGN1
cnJlbnQgc3RhdHVzIG9mIHRoZSBETUEgaGVhcHMuIEFyZSB3ZQo+PiBzdGlsbCBnb2luZyB0byB1
c2UgRE1BIGhlYXBzPwo+Pgo+IAo+IFNvcnJ5LCBzaG91bGQgaGF2ZSBtZW50aW9uZWQgdGhlIHN0
YXR1cyBpbiB0aGUgY292ZXIgbGV0dGVyLiBJIHNlbnQgYW4KPiBlbWFpbCB0byBkcmktZGV2ZWwg
YWJvdXQgaG93IERNQSBoZWFwcyBzaG91bGQgYmUgdXNlZCAtLSBJIGJlbGlldmUgdGhlCj4gY29u
Y2x1c2lvbiB3YXMgdGhhdCBpdCdzIG5vdCBlbnRpcmVseSBjbGVhciwgYnV0IGRtYS1idWZzIHNo
b3VsZCBvbmx5IGJlCj4gdXNlZCBmb3IgYnVmZmVycyBzaGFyZWQgYmV0d2VlbiBlbmdpbmVzLiBT
byBmb3IgdGhlIHRpbWUgYmVpbmcsIHdlCj4gc2hvdWxkIHN0aWxsIGltcGxlbWVudCBHRU0gZm9y
IGludHJhLVRlZ3JhRFJNIGJ1ZmZlcnMuIFRoZXJlIHNlZW1zIHRvIGJlCj4gc29tZSBwbGFubmlu
ZyBvbmdvaW5nIHRvIHNlZSBpZiB0aGUgZGlmZmVyZW50IHN1YnN5c3RlbSBhbGxvY2F0b3JzIGNh
bgo+IGJlIHVuaWZpZWQgKHNlZSBkbWEtYnVmIGhlYXBzIHRhbGsgZnJvbSBsaW51eCBwbHVtYmVy
cyBjb25mZXJlbmNlKSwgYnV0Cj4gZm9yIG5vdyB3ZSBzaG91bGQgZ28gZm9yIEdFTS4KClRoYW5r
cyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
