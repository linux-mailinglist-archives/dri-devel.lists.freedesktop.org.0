Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70FB611FC5
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 05:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E1110E22E;
	Sat, 29 Oct 2022 03:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2641E10E22E;
 Sat, 29 Oct 2022 03:32:15 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 128so6417205pga.1;
 Fri, 28 Oct 2022 20:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VHF9euNOOmuwTSh72fVwWU/hhjv7B36F6rq6GHbm0Ws=;
 b=jK5E1boC3hu8E7IKKZ6CHa/8w55eH6o4SWLIwK/DleiUhoRlRDg0nhbUtjDD76L7q5
 93OjujLRcE31fBxMQ2A0Gq0z7tfH3bVlJrRbhHYggtjqQOD3sXuqsv9rLVy3tUHpT+Yc
 VdPaxC13yA9VPuPQa1jUO32XmDCgV05Qw6tk86KFBLTLTEi1+16B2KRw/EOFxOQhUxRd
 23NpFy8Er4yVa2BlmTYeUNvzKWgQPO81xAkxWaP0kL+zrWMnGOgCmpkjnHdOb3S3ECSE
 9rmz+S8TZ8vjt7qSFnvAXDJHEa/g8fsHS8FkZdPyqZsJl1Sk4yoAL+/UVz9wjHiUBH4h
 TpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VHF9euNOOmuwTSh72fVwWU/hhjv7B36F6rq6GHbm0Ws=;
 b=YPPnE2rvGsyp4biJLfh5lSXEGuvrp2a1JHfDrfW9a0Hm5bzO052eRUyA42HU+SFkgw
 mryuT12xMMapHTf3C/YU8m/BjNSABK7z+wVAG5N6YvzPpNAz4/5EDiOgUg77sfOdF5V3
 euFqFsGq3fD03FKDcPeKL2BGTOCmuhL91LK89ca9n1yOMnhz+2r/UOU+hCwYTbtNLhAC
 x0jRE3jloEcH3z+dJrtFORghDmKdb2xamkNjAR/Gazln579lxxfdZViKlgX5RIHAmiCD
 F7oHFotE/Ch85zQ1kKovNDKV4a0d7s15ScrsEuKEGU+LsVrtSE3nCI6rzLQ6M1n6AUaF
 gC0g==
X-Gm-Message-State: ACrzQf0Bg5GT1B8AjHEAjnwBRGWKDCkjX12m3uYsWWXXtrecDUwLAuvf
 E0cnJP6nOA6GC+Q340rRq34=
X-Google-Smtp-Source: AMsMyM4/G+OuCQ0NgmhKRELRXL1n+O5c6TyxtS8A7lOlSNpmzBFb7z6dw442d6bOx/QJA+JG8vf/tQ==
X-Received: by 2002:aa7:8b46:0:b0:56c:349f:191e with SMTP id
 i6-20020aa78b46000000b0056c349f191emr2663102pfd.29.1667014334674; 
 Fri, 28 Oct 2022 20:32:14 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090a2e8200b002086ac07041sm166491pjd.44.2022.10.28.20.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 20:32:13 -0700 (PDT)
Date: Sat, 29 Oct 2022 16:32:05 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
Message-ID: <Y1yetX1CHsr+fibp@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1trhRE3nK5iAY6q@mail.google.com>
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
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One-element arrays are deprecated, and we are replacing them with
flexible array members instead. So, replace one-element array with
flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
refactor the rest of the code accordingly.

It's worth mentioning that doing a build before/after this patch results
in no binary output differences.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/239
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Changelog:

v2: no binary output differences patch; report binary changes findings
    on commit log. Res: Kees Cook.
    
    This request was made in an identical, yet different, patch but the
    same feedback applies.
    https://lore.kernel.org/lkml/Y1x3MtRJ8ckXxlJn@mail.google.com/

v1: https://lore.kernel.org/lkml/Y1trhRE3nK5iAY6q@mail.google.com/
---
 drivers/gpu/drm/radeon/atombios.h        | 2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index da35a970fcc0..235e59b547a1 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -3615,7 +3615,7 @@ typedef struct _ATOM_FAKE_EDID_PATCH_RECORD
 {
   UCHAR ucRecordType;
   UCHAR ucFakeEDIDLength;
-  UCHAR ucFakeEDIDString[1];    // This actually has ucFakeEdidLength elements.
+  UCHAR ucFakeEDIDString[];    // This actually has ucFakeEdidLength elements.
 } ATOM_FAKE_EDID_PATCH_RECORD;
 
 typedef struct  _ATOM_PANEL_RESOLUTION_PATCH_RECORD
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 204127bad89c..4ad5a328d920 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -1727,8 +1727,11 @@ struct radeon_encoder_atom_dig *radeon_atombios_get_lvds_info(struct
 						}
 					}
 					record += fake_edid_record->ucFakeEDIDLength ?
-						fake_edid_record->ucFakeEDIDLength + 2 :
-						sizeof(ATOM_FAKE_EDID_PATCH_RECORD);
+						  struct_size(fake_edid_record,
+							      ucFakeEDIDString,
+							      fake_edid_record->ucFakeEDIDLength) :
+						  /* empty fake edid record must be 3 bytes long */
+						  sizeof(ATOM_FAKE_EDID_PATCH_RECORD) + 1;
 					break;
 				case LCD_PANEL_RESOLUTION_RECORD_TYPE:
 					panel_res_record = (ATOM_PANEL_RESOLUTION_PATCH_RECORD *)record;
-- 
2.37.3

