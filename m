Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC76F5F6E53
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C888C10E4DF;
	Thu,  6 Oct 2022 19:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B2A10E4DF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 19:42:08 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1324e7a1284so3361566fac.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6r/G/FPUQy4dyX7xrRC1W4jJwBxwg1McHDgAeD3KbOs=;
 b=YKJ3k2p8QKCGtiarfIip3UkE7k+qso3S4D5O6YqUUSyP9shpTpIBxQ8/kS+RV0sYfc
 bFuz56vn343CcKDBnRjfLE57o/IssaFZ9TCsZ0xsABahSkoCysy/EDoS3ViORklXE4jd
 tXnlQ+T7k1o9CnYhtqc5Vo8cI0yeVD1kbIflE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6r/G/FPUQy4dyX7xrRC1W4jJwBxwg1McHDgAeD3KbOs=;
 b=InQqTaCiBOnusRz8mOmWd0RNAI77N1V1QPwTklZ9LlZUA1Duz+fQp9xXPcteOnCAUZ
 g0upaQqvZ9FaEyfcMM40kivrDTRpXshzx2p6Q0tQCcufLRWK/DagU/wM/ulPDJKaB4O+
 38lCTwzvxVrKondDMh4XneQs+YNIxPEinPFr3RkxPEhtZOpda8FcHlZ5ol0xtkUAjzAF
 uXKVaCrwufWNkvVK78UlgC8ZwTbeorZacwRuJsA0gH24CFjSR3U2G+Vxmc3G+pNmySKq
 uMP/v8TyLc6yD+InDo4X0XpzfqQRwV436wCdjlBc0fbMWMB8swSdJOEjAiId1k1uBG//
 VFPw==
X-Gm-Message-State: ACrzQf35kjJqmtlTkwN8RM83vY6YJx9Pqw29apQfop84uBYF0HL70Eaq
 oLsqg6kkXlXukWLZqNReuzXjtHDgZG3r3Q==
X-Google-Smtp-Source: AMsMyM4Bdkpsm1YM502KXr19Hd8lJpKKbTQSCcDVqy5/tm/Y13y/SyC3vq+RfhLJxHvMpxLHUwnbaQ==
X-Received: by 2002:a05:6870:b14f:b0:127:d4f1:6a90 with SMTP id
 a15-20020a056870b14f00b00127d4f16a90mr769993oal.116.1665085326936; 
 Thu, 06 Oct 2022 12:42:06 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com.
 [209.85.167.177]) by smtp.gmail.com with ESMTPSA id
 u18-20020a056870f29200b0012b298699dbsm330897oap.1.2022.10.06.12.42.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 12:42:06 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id l5so3199436oif.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:42:06 -0700 (PDT)
X-Received: by 2002:aca:b957:0:b0:351:4ecf:477d with SMTP id
 j84-20020acab957000000b003514ecf477dmr640795oif.126.1665085325931; Thu, 06
 Oct 2022 12:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CAPM=9tzr1EAA=OaFmrPFT3UqQO+dixdZTPzs=tqdmgP+F_ojEA@mail.gmail.com>
In-Reply-To: <CAPM=9tzr1EAA=OaFmrPFT3UqQO+dixdZTPzs=tqdmgP+F_ojEA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Oct 2022 12:41:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whgmaqcw0mXYM+rMt_h-_g+0hoP3ZUPhizN3VtmqLVFTw@mail.gmail.com>
Message-ID: <CAHk-=whgmaqcw0mXYM+rMt_h-_g+0hoP3ZUPhizN3VtmqLVFTw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 12:30 PM Dave Airlie <airlied@gmail.com> wrote:
>
> netconsole?

I've never been really successful with that in the past, and haven't
used it for decades. I guess I could try if nothing else works.

               Linus
