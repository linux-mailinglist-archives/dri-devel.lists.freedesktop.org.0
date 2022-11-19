Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D18630EAC
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 13:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5085E10E10C;
	Sat, 19 Nov 2022 12:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DDA10E271
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 12:21:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v1so13189464wrt.11
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 04:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3i4saDheNNSW7rU5zhzZgJAG50PuzgutcDNB0OsxXUE=;
 b=hetF44iglb3Xbd0bhzXvVVctRNm/1F31jTp+ak2dUjMmows8yGCugYyDVM2VJ9kjT4
 Wt25LM7ipx2IkakQVIfCIoreEZ3vDrMEnGZMHgZpkb3sSqpq/r/nfGOXs1IWUwH05c4m
 56FVy/sZB/UTSZmRMVwVxTmaOA4w61/uTtR+htftOiOHSoZQboiSZxsEL4S/8xhU/P/P
 ZIZDfNyyLJswfHyZmIumaLI94fYfDkzaVRUgyGCoU0SuQYRBbSWzvrE+o6KECjEadDdY
 VLd0SEjs8StlZ4oSSxXB4TbgkMX+GF9mqMPkQ/pGp54x7ExQzNnjyvz4dd++M9YtdISG
 iRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3i4saDheNNSW7rU5zhzZgJAG50PuzgutcDNB0OsxXUE=;
 b=6kyrQtTVVfW94m20bv4PbV4a728vGHfYVn60imN2bmhyS5ADpvIno4z+aFRsZqlZ+R
 V133Jc/xw5cDsUTL6mRKcjHL5jfQqWlk4EoCTd8i3xqhOcr4MSZRcrHFGHV4KXtPwKZM
 ygn2hys81+7U+9CSMkdMmg8aO2VfdHi2TLRCIsNsJmM289vaakjjpTCF9ponVVVOABlI
 VXszEKW7Ud8LcYMXFTlXK9wsQnaRU+oUBG1QOd2lVq4qzGCaRRPgagZpzQWjdhC8E1G9
 LAauJgYAAUJwPyiVuD2a8zUb/zMibFvuyHMG9dZvTyDfIXA7M47w/A1okg0QpuLx7oSz
 5Dug==
X-Gm-Message-State: ANoB5pl4PwAoHR6cTgCUhn4NQoYT6heUcBInoOJKFhONo04l/1qWD+QS
 D97WNjJpzoQnwd7KPgY52C/f//ZFpUA=
X-Google-Smtp-Source: AA0mqf6rOz58LdioPFb/7LtQdgemxujzUOVokFGrCpJCCFbldSO10zJTLRGjdLD1EF3IQWqjl+di7w==
X-Received: by 2002:adf:f408:0:b0:236:62c9:afa3 with SMTP id
 g8-20020adff408000000b0023662c9afa3mr6462644wro.467.1668860487682; 
 Sat, 19 Nov 2022 04:21:27 -0800 (PST)
Received: from elementary ([94.73.35.229]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d6b81000000b00226dba960b4sm6125635wrx.3.2022.11.19.04.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 04:21:27 -0800 (PST)
Date: Sat, 19 Nov 2022 13:21:25 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [bug report] Merge branch 'for-linux-next' of
 git://anongit.freedesktop.org/drm/drm-misc
Message-ID: <20221119122125.GA51798@elementary>
References: <Y3dpzq5o3j/iZn4Q@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3dpzq5o3j/iZn4Q@kili>
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
Cc: sfr@canb.auug.org.au, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On Fri, Nov 18, 2022 at 02:17:34PM +0300, Dan Carpenter wrote:
> Hello Stephen Rothwell,
> 
> The patch 23b727d76bda: "Merge branch 'for-linux-next' of
> git://anongit.freedesktop.org/drm/drm-misc" from Nov 17, 2022, leads
> to the following Smatch static checker warning:
> 
> 	drivers/gpu/drm/vc4/vc4_hdmi.c:351 vc4_hdmi_reset_link()
> 	error: uninitialized symbol 'vc4_hdmi'.
> 
> drivers/gpu/drm/vc4/vc4_hdmi.c
>     346 
>     347         crtc_state = crtc->state;
>     348         if (!crtc_state->active)
>     349                 return 0;
>     350 
> --> 351         mutex_lock(&vc4_hdmi->mutex);
>                            ^^^^^^^^^
> This locking
> 
>     352 
>     353         vc4_hdmi = connector_to_vc4_hdmi(connector);
>                 ^^^^^^^^^^
> needs to be done after this assignment.  But this is only in linux-next
> so presumably it's a temporary thing.
> 
>     354         if (!vc4_hdmi_supports_scrambling(vc4_hdmi)) {
>     355                 mutex_unlock(&vc4_hdmi->mutex);
>     356                 return 0;
>     357         }
>     358 
>     359         scrambling_needed = vc4_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_adjusted_mode,
>     360                                                            vc4_hdmi->output_bpc,
> 
> regards,
> dan carpenter

I think that Stephen already handled this issue as discussed here:
https://lore.kernel.org/all/Y3ZvffZiR+SgtY6h@dev-arch.thelio-3990X/

Jose
