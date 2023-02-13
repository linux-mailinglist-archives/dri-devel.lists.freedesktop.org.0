Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ECE695250
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0B510E729;
	Mon, 13 Feb 2023 20:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEE710E245;
 Mon, 13 Feb 2023 20:50:46 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PFxLt4b3vzDr25;
 Mon, 13 Feb 2023 20:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676321446; bh=ZNrl5M1BCt01/KLEAs6jNxJB4FRSDDpY/qQqExWe4zk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dPtrzU/BU6xW9esnzpvByxNVqS6suC81zezNVW5Ysg0yO5n6+R6jfoWXChGOHDg+V
 BoOe+SC7b1Q8xc1+d0ekuhJuDeYKeOhC5S7EdPTt71lLh0Gjb0q6HZ3JMxUEmMP8uu
 Q0bWJOAn9eVsijPtjiVBF/v6C7SavMlFDnAIWj+g=
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PFxLs74Zzz9spH;
 Mon, 13 Feb 2023 20:50:45 +0000 (UTC)
X-Riseup-User-ID: 4834CFAFF8286860AF7E4F70C1308D8F85EB9AE31BDEA24C1F89DCB7D0A24686
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PFxLn4Kfdz1y8Z;
 Mon, 13 Feb 2023 20:50:41 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] drm/amd/display: Remove unused local variables and
 function
Date: Mon, 13 Feb 2023 17:49:23 -0300
Message-Id: <20230213204923.111948-11-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-1-arthurgrillo@riseup.net>
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Arthur Grillo <arthurgrillo@riseup.net>,
 mairacanal@riseup.net, alexander.deucher@amd.com, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove a couple of local variables that are only set but never used,
also remove an static utility function that is never used in consequence
of the variable removal.

This decrease the number of -Wunused-but-set-variable warnings.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  | 41 -------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
index 24e9ff65434d..05aac3e444b4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
@@ -72,40 +72,6 @@ static void apg31_disable(
 	REG_UPDATE(APG_CONTROL2, APG_ENABLE, 0);
 }
 
-static union audio_cea_channels speakers_to_channels(
-	struct audio_speaker_flags speaker_flags)
-{
-	union audio_cea_channels cea_channels = {0};
-
-	/* these are one to one */
-	cea_channels.channels.FL = speaker_flags.FL_FR;
-	cea_channels.channels.FR = speaker_flags.FL_FR;
-	cea_channels.channels.LFE = speaker_flags.LFE;
-	cea_channels.channels.FC = speaker_flags.FC;
-
-	/* if Rear Left and Right exist move RC speaker to channel 7
-	 * otherwise to channel 5
-	 */
-	if (speaker_flags.RL_RR) {
-		cea_channels.channels.RL_RC = speaker_flags.RL_RR;
-		cea_channels.channels.RR = speaker_flags.RL_RR;
-		cea_channels.channels.RC_RLC_FLC = speaker_flags.RC;
-	} else {
-		cea_channels.channels.RL_RC = speaker_flags.RC;
-	}
-
-	/* FRONT Left Right Center and REAR Left Right Center are exclusive */
-	if (speaker_flags.FLC_FRC) {
-		cea_channels.channels.RC_RLC_FLC = speaker_flags.FLC_FRC;
-		cea_channels.channels.RRC_FRC = speaker_flags.FLC_FRC;
-	} else {
-		cea_channels.channels.RC_RLC_FLC = speaker_flags.RLC_RRC;
-		cea_channels.channels.RRC_FRC = speaker_flags.RLC_RRC;
-	}
-
-	return cea_channels;
-}
-
 static void apg31_se_audio_setup(
 	struct apg *apg,
 	unsigned int az_inst,
@@ -113,24 +79,17 @@ static void apg31_se_audio_setup(
 {
 	struct dcn31_apg *apg31 = DCN31_APG_FROM_APG(apg);
 
-	uint32_t speakers = 0;
-	uint32_t channels = 0;
-
 	ASSERT(audio_info);
 	/* This should not happen.it does so we don't get BSOD*/
 	if (audio_info == NULL)
 		return;
 
-	speakers = audio_info->flags.info.ALLSPEAKERS;
-	channels = speakers_to_channels(audio_info->flags.speaker_flags).all;
-
 	/* DisplayPort only allows for one audio stream with stream ID 0 */
 	REG_UPDATE(APG_CONTROL2, APG_DP_AUDIO_STREAM_ID, 0);
 
 	/* When running in "pair mode", pairs of audio channels have their own enable
 	 * this is for really old audio drivers */
 	REG_UPDATE(APG_DBG_GEN_CONTROL, APG_DBG_AUDIO_CHANNEL_ENABLE, 0xFF);
-	// REG_UPDATE(APG_DBG_GEN_CONTROL, APG_DBG_AUDIO_CHANNEL_ENABLE, channels);
 
 	/* Disable forced mem power off */
 	REG_UPDATE(APG_MEM_PWR, APG_MEM_PWR_FORCE, 0);
-- 
2.39.1

