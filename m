Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD561099D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 07:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4447C10E758;
	Fri, 28 Oct 2022 05:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AAB10E758;
 Fri, 28 Oct 2022 05:10:59 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so8854038pjk.2; 
 Thu, 27 Oct 2022 22:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EW5mS+GWU1SupYaIIjSXlUc0IhtqJK+50Uo45NdbWBY=;
 b=q6yImUxFLTMfanG+izGED95xKf3LufN3J34sg6wfjnz9NMfpaYj8F4MEKJ7vWziSNY
 37S4Gra4Kr3oQNfnmI7g6yZIwJyrIj3kgEXO5xxhpMKXRde+8/x8VdNxmtEyPPwlnFad
 Qi+G6D00gt+jSvM4/n2MeS2L2HLch255epOJ2r/83DrmquuGt2UTgZW+6ma/nLnHX0KO
 Vgjr14CKLyOenoWatMLS4VBRmwz8GpabUezC+w/LZgxkQKeaj/py+3bo6nlvDW2aIp97
 ZNZ1zkT9kcQEy/DSvXKWzTAV73ZFeSvRR48bPpY/7C5UlAtlkJ2KIBqFYwKJDUJVu6OH
 KhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EW5mS+GWU1SupYaIIjSXlUc0IhtqJK+50Uo45NdbWBY=;
 b=BfLH+hEzoTY8vLf3Tl61vRYAgBS7SeTpgnl9xlIkd28s2Ml04X4hyhw0r0rJ9Fk5tn
 BW7KhqHzDlv3R1UvBzNrKf+iy1hNjMOMtt8cxt8v9wMWH8LdzWQ4eQYWa44xgaESbOSS
 ylQAL1BCGCJqE9wahW7hLPVzjoGpDTFwOZ0U69RzBspjqdJfa5ohvKiq0vWEyvIKMFZz
 Y1xj4+RVyjjZcsGAF+gQ4TShm1+oUbz2sVU0zRUH/J4r/PaXT3CYYSFU0RCInG7pXNQQ
 U1ou19jM2k52wP1B8ZCNp4YK/eQYWYik48yVf+lMwIPtnz/vT2DHG4LvovpGmskp4AG1
 CWlw==
X-Gm-Message-State: ACrzQf39VoggkTIZPOLixMZWRJIgBXskaT8b16/PB7QplrXEIizYGPqh
 7QbgIc9PduVmesQuTWgfaSj3IkLAZ/GU6hzA
X-Google-Smtp-Source: AMsMyM5GM/3tLFRJYxepSO/XFCIBgVeZFKsq4TMsmUupAFVXO71DeS3BNZM+MP1OT/kUE34Oyew6lg==
X-Received: by 2002:a17:902:ef43:b0:186:99be:2ee9 with SMTP id
 e3-20020a170902ef4300b0018699be2ee9mr12142176plx.148.1666933859072; 
 Thu, 27 Oct 2022 22:10:59 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902e9c500b0018691ce1696sm2075367plk.131.2022.10.27.22.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 22:10:58 -0700 (PDT)
Date: Fri, 28 Oct 2022 18:10:49 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, Grigory Vasilyev <h0tc0d3@gmail.com>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Claudio Suarez <cssk@net-c.es>, Slark Xiao <slark_xiao@163.com>,
 Rongguang Wei <weirongguang@kylinos.cn>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] [next] drm/amdgpu: Replace one-element array with
 flexible-array member
Message-ID: <Y1tkWdwPUp+UdpM0@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One-element arrays are deprecated, and we are replacing them with
flexible array members instead. So, replace one-element array with
flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
refactor the rest of the code accordingly.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/238
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 10 +++++++---
 drivers/gpu/drm/amd/include/atombios.h         |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index 6be9ac2b9c5b..6b5abf1249db 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -2079,10 +2079,14 @@ amdgpu_atombios_encoder_get_lcd_info(struct amdgpu_encoder *encoder)
 							} else
 								kfree(edid);
 						}
+
+						record += struct_size(fake_edid_record,
+								      ucFakeEDIDString,
+								      fake_edid_record->ucFakeEDIDLength);
+					} else {
+						/* empty fake edid record must be 3 bytes long */
+						record += sizeof(ATOM_FAKE_EDID_PATCH_RECORD) + 1;
 					}
-					record += fake_edid_record->ucFakeEDIDLength ?
-						fake_edid_record->ucFakeEDIDLength + 2 :
-						sizeof(ATOM_FAKE_EDID_PATCH_RECORD);
 					break;
 				case LCD_PANEL_RESOLUTION_RECORD_TYPE:
 					panel_res_record = (ATOM_PANEL_RESOLUTION_PATCH_RECORD *)record;
diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index 15943bc21bc5..b5b1d073f8e2 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -4107,7 +4107,7 @@ typedef struct _ATOM_FAKE_EDID_PATCH_RECORD
 {
   UCHAR ucRecordType;
   UCHAR ucFakeEDIDLength;       // = 128 means EDID length is 128 bytes, otherwise the EDID length = ucFakeEDIDLength*128
-  UCHAR ucFakeEDIDString[1];    // This actually has ucFakeEdidLength elements.
+  UCHAR ucFakeEDIDString[];     // This actually has ucFakeEdidLength elements.
 } ATOM_FAKE_EDID_PATCH_RECORD;
 
 typedef struct  _ATOM_PANEL_RESOLUTION_PATCH_RECORD
-- 
2.37.3

