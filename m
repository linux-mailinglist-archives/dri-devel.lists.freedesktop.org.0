Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA71D0A61
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 10:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1B96E9B0;
	Wed, 13 May 2020 08:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54676E9B0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 08:01:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so19632697wrt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 01:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qOmmunlWx5TbxpEYsCi6LXm1KoaU+vaRN5iuBeMyAvA=;
 b=wwGGIzfhjfM9NgXhcpJu8mIl16HfUpZxpzVQ0jfZyEuuJGGHo6S3WyOm4VQNJqtNJ/
 Zz93RR+VCNEoT+QCqEzG2uAUgNhcaMiybCUp+DobkeU64t8Za/EyWgGHc9O6Lx3oOsNM
 TPIQ/1bNv/yAs6qveLsyOUaJqV9S+l0LnS4N4ndUR6IBwgVktAZUDeGPg7lDs/1TbkiZ
 pizBletTSn7fUiS6rRNQXESiQuNFvoYgScCVqHaNRqRbl4ZwuzRVNOOOxtYuf6WvO1Ty
 thsS1053p4825+Sh7yU70apSzy1Va35O3gTFABx8YTEocfHcEsW9hfxnvgtZ1lcPFeY9
 umjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qOmmunlWx5TbxpEYsCi6LXm1KoaU+vaRN5iuBeMyAvA=;
 b=QYZaxjyyKGAgut8dO+TC+W5Xj4DS6jPQW88uuvn/xVmvj1MVaPJ06ZZUUOmavxMGb2
 RwYHfD7P6OrGbT1W2UzWu6uaNkH2op03+J6/bu7Cxm3W563JAZaM1iUey46ttsp1nBYV
 xPlP9GsW7fWjGNwT0ZtzNK3KZ2VGWACM/gVka5JcBMMMT+kWQcYlgX/pUGo20aGqFpdC
 vfN/Ijnim8kpvcBeGOs7ISgOs88NDg/2R/U0pidbHht0fQKprKsmlG/qN5qZA4LfqUY7
 1aVXnLa6AeX+zZ5vmNYtrg1KdRablai8RbbfchDQwXDgMv23Qxysgm2boaGIqByUjyB/
 dcIQ==
X-Gm-Message-State: AGi0PuZRzmw29NwARy3HGlffhSbEQ5hChzJTPV4WTP0whAfeHQ7L4wAW
 AEYc027paoDYcf+BPQoB7Mfrlg==
X-Google-Smtp-Source: APiQypLqRksq0eSlol4tSTwedgyaTVM2PgFckTaG8ma5JptZgQpiUumnGNrPnWn12cdi9hLSZsxIVQ==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr15451539wrl.338.1589356862397; 
 Wed, 13 May 2020 01:01:02 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id c25sm33770259wmb.44.2020.05.13.01.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 01:01:01 -0700 (PDT)
Date: Wed, 13 May 2020 09:00:59 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/1] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200513080059.GD3548@dell>
References: <20200326210959.13111-1-wsa+renesas@sang-engineering.com>
 <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
 <20200417101446.GB3737@dell> <20200512162546.GG13516@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512162546.GG13516@ninjato>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBNYXkgMjAyMCwgV29sZnJhbSBTYW5nIHdyb3RlOgoKPiBPbiBGcmksIEFwciAx
NywgMjAyMCBhdCAxMToxNDo0NkFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBUaHUs
IDI2IE1hciAyMDIwLCBXb2xmcmFtIFNhbmcgd3JvdGU6Cj4gPiAKPiA+ID4gTW92ZSBhd2F5IGZy
b20gdGhlIGRlcHJlY2F0ZWQgQVBJIGFuZCByZXR1cm4gdGhlIHNoaW55IG5ldyBFUlJQVFIgd2hl
cmUKPiA+ID4gdXNlZnVsLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5n
IDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC90b3NhX2xjZC5jIHwgNCArKy0tCj4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBBcHBsaWVkLCB0
aGFua3MuCj4gCj4gVGhhbmtzISBJIGRvbid0IHNlZSBpdCBpbiAtbmV4dCwgdGhvdWdoPwoKSnVz
dCBwdXNoZWQuICBTaG91bGQgYmUgdGhlcmUgc29vbi4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
