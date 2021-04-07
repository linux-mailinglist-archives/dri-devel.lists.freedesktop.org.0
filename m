Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82387356520
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 09:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F05F898CC;
	Wed,  7 Apr 2021 07:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D8D898CC;
 Wed,  7 Apr 2021 07:23:18 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id s15so4601309edd.4;
 Wed, 07 Apr 2021 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ret4OxZrfBqhr8Mso7pIrjolKpFxFbEy0PkaLzTdNd8=;
 b=jYVsZIZiB8DATQ1Dwf4tEFs8v8nVzahT/TPmRMLTYgG81S+qV+muCHs6ert7y/y9Ez
 8bwwkbAMp1mXhQNdz9I3pbIRtJB86uQrF0Kcu+Yd3nlZKi5fPxaHlc8q4/fagmG1+Xc8
 pSQwna59oRHLAgY19IgfYojtmYVN23ZwRsvFvHR+cGYnenVW2IOIZmJpu+MBNvJI/IPp
 4JSCDdyFvA+q4SdmNFXS1uRw8PSGxwqJHkeSmyRxotTYz7qL9E4llmDdWN3gLA7ZgrZQ
 7D0tOjn20s7ygtHSo/v9JMJLpxDjyjy8ckxmwl/GBU02Tee5i6W95LA39rN/HzFT7nTz
 t8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ret4OxZrfBqhr8Mso7pIrjolKpFxFbEy0PkaLzTdNd8=;
 b=jwZGxv9j3kE3jQssKLk1rKtU1X0Ql7sn31NJCCHoUq36sfMRhZj3lIkH+rXn6Ie6Ns
 T7Bhfo1jytUuPT3S8b8Rc53Ff+W6l5rUiXbcqyCGlXiYv+J5c5FEHgmZA8XXX2dnhydI
 dgWDR0NsGe5ZkUt4FeYJWrikdTP8xPf3iyVX0FvOxgDhjWj3ER5E3F8d2C4PDaNIe4Zo
 1rcyQomVPxBIofpBPi5ngYzk2p3iHMfzye4mOgmQ17EvK0UAVh+yl8jFOCIGfTx7QfQE
 hxuuN6oeuHrq2CuW9X2TfV6M2OK0QY82aV/yavmuqa9/YqTlieHLmcrAitBASqD8Lsaq
 z6gQ==
X-Gm-Message-State: AOAM53192mF2b5M0jXx6LeRRmpQBzf5ICD67P1dSwvu9+i7/NHZeTHvo
 bldyIVErp3B8hlcI/SjpbF0++B7TQ8XEnOIMl1VHde5x
X-Google-Smtp-Source: ABdhPJzZrDTYNiMWLGiKwMCulFVs2RVlEzYr5yu039nqSLFoliOK6YOs1BjYQIRxwvzYqe9S6h2D8ZrEIxp26w016RY=
X-Received: by 2002:a05:6402:1115:: with SMTP id
 u21mr2667615edv.383.1617780196633; 
 Wed, 07 Apr 2021 00:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210401222931.3823-1-alexander.deucher@amd.com>
 <0fa472a5-08b4-87cd-c295-7502bd30c2c0@gmail.com>
 <CADnq5_NXz-B3BjQdP1x7P3tPC160EO906_TZObJhx85CHt6b2A@mail.gmail.com>
In-Reply-To: <CADnq5_NXz-B3BjQdP1x7P3tPC160EO906_TZObJhx85CHt6b2A@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 7 Apr 2021 17:23:05 +1000
Message-ID: <CAPM=9twymi8Emi+GpDW0Gz_OQ63BGwwzKwF_Jxq8=i_VC9U=3w@mail.gmail.com>
Subject: Re: [pull] amdgpu, radeon, ttm, sched drm-next-5.13
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA3IEFwciAyMDIxIGF0IDA2OjU0LCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAyLCAyMDIxIGF0IDEyOjIyIFBNIENocmlz
dGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+
ID4KPiA+IEhleSBBbGV4LAo+ID4KPiA+IHRoZSBUVE0gYW5kIHNjaGVkdWxlciBjaGFuZ2VzIHNo
b3VsZCBhbHJlYWR5IGJlIGluIHRoZSBkcm0tbWlzYy1uZXh0Cj4gPiBicmFuY2ggKG5vdCAxMDAl
IHN1cmUgYWJvdXQgdGhlIFRUTSBwYXRjaCwgbmVlZCB0byBkb3VibGUgY2hlY2sgbmV4dCB3ZWVr
KS4KPiA+Cj4KPiBUaGUgVFRNIGNoYW5nZSBpcyBub3QgaW4gZHJtLW1pc2MgeWV0Lgo+Cj4gPiBD
b3VsZCB0aGF0IGNhdXNlIHByb2JsZW1zIHdoZW4gYm90aCBhcmUgbWVyZ2VkIGludG8gZHJtLW5l
eHQ/Cj4KPiBEYXZlLCBEYW5pZWwsIGhvdyBkbyB5b3Ugd2FudCB0byBoYW5kbGUgdGhpcz8gIFRo
ZSBkdXBsaWNhdGVkIHBhdGNoIGlzIHRoaXMgb25lOgo+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3Rv
cC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9YWM0ZWI4M2FiMjU1ZGU5YzMxMTg0ZGY1MWZk
MTUzNGJhMzZmZDIxMgo+IGFtZGdwdSBoYXMgY2hhbmdlcyB3aGljaCBkZXBlbmQgb24gaXQuICBU
aGUgc2FtZSBwYXRjaCBpcyBpbmNsdWRlZCBpbiB0aGlzIFBSLgoKT3VjaCBub3Qgc3VyZSBob3cg
YmVzdCB0byBzeW5jIHVwIGhlcmUsIG1heWJlIGdldCBtaXNjLW5leHQgaW50byBteQp0cmVlIHRo
ZW4gcmViYXNlIHlvdXIgdHJlZSBvbiB0b3Agb2YgaXQ/CgpEYXZlLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
