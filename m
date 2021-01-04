Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE32E955E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 13:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CA189FDB;
	Mon,  4 Jan 2021 12:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41A089FDB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 12:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NM1X5+8RLoqvDbNIu7H+uXlc13OBxxSCSAVxnTeNbOMBHQnQcktWmBTQs8/f7ZyWXnElHE2PPv9HCNssrraz34zqjJnWZOV94iZO5Cz8t2M+K4pAIwx/zHk9qfnDt3wECGGoTDHO1T7A6lIsumS0IZjcSqtB8wmggezZ2gHQY9419lp0vEVT3S9Bc5MrZkCiVIWiOSY9+Z0E3OsO8S6pfKAPTfvrQenoyr5lvgeNdVbTxUu7MK7VPjq1ZmpiiZpUSYJbwDWz5hBZv8xKwmGRjv39aK6J9tEyfDl0ZgT3wet1g9pEFm8RxajtqrcaV7zU97EwNdq7IVcGsYVMlbTm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaJXmyM2Ry20MMOZkhYz0Uc1PtUHYT6Bw3PURcU15Zw=;
 b=V4zMqJsCbsN8edUWd/h/Cl11hawRxkUqOF715/N6ltTPGljvx7wRPA9+e+xTViT9ssfpKnbiXA+5JIpqkeQKbhbagVggvgkhTqXPiko7lDGYZhZlh+rmqG6T0iKVCmOfJ9e6qfQk0/GCfHVuKeujR2w9CrTpKhXK5+neItaOdHlwhN62gj8Zxc+QaYzvuW4IJaRAaqV6sZm0FhlXMHvAtv23QcNHMM0MkU9sxbHsulOzjSZzYkGECe/3NQF39lCYhJONbnqwAWoAQpM77vW9Kitw66L/ZG2eRTniRBSfeMHW1PCNLpIje+5Wjli9ODOgZa5MDDUjBxa9uPC4+D7grw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaJXmyM2Ry20MMOZkhYz0Uc1PtUHYT6Bw3PURcU15Zw=;
 b=QjagjMhBoQ3QS6IS/KtS0DG3eWUrzX5od1GTq1nxKrnLLTPnWMNzLKDRIT71sdEsv2MmQC+J5fsDdpg7/SinqvI0UG9314KWoIzq9ipITp/MFc+PliCNbnFD9OJdaYLfybZxvJblxP4UtTo0qNfBhMZFhkjmM8iJZX3r3CjTkZ8=
Received: from BN8PR12MB4770.namprd12.prod.outlook.com (2603:10b6:408:a1::30)
 by BN7PR12MB2593.namprd12.prod.outlook.com (2603:10b6:408:25::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 12:58:00 +0000
Received: from BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::a440:d0d:9875:252]) by BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::a440:d0d:9875:252%6]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 12:58:00 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Arnd Bergmann <arnd@kernel.org>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "R, Bindu" <Bindu.R@amd.com>
Subject: RE: [PATCH] drm/amd/display: Fix unused variable warning
Thread-Topic: [PATCH] drm/amd/display: Fix unused variable warning
Thread-Index: AQHW4dkkpTQdEwPNtE2e5OslrfcQZqoXbUZA
Date: Mon, 4 Jan 2021 12:58:00 +0000
Message-ID: <BN8PR12MB4770D2DD3E0A5ECF5EA9C55AFCD20@BN8PR12MB4770.namprd12.prod.outlook.com>
References: <20210103140248.3889757-1-arnd@kernel.org>
In-Reply-To: <20210103140248.3889757-1-arnd@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=e13ab4c6-ac6b-45c2-8c2d-c33fd7128f5d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-04T12:52:40Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [36.238.154.142]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9c5ed789-1d4d-4569-cbe5-08d8b0b05da9
x-ms-traffictypediagnostic: BN7PR12MB2593:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB25933F45DF5957E6C11DA79BFCD20@BN7PR12MB2593.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LVzjsq2BSm3dA4L5bhBVg1TiNZD5thjMUnzHPE5ti+E1Yp46/77N3iZClknblXbMcnuNw+moMq+RohupnGiRLtzhsF/DVWX/XvCsa2UgOgZT8lFHyTZ4GAOiwFzojea983YzVROOmeHcrYlX51PzDvLoo34K1sELE+fqDmmqlZ0oW5xEvRQ1taDLZ/lzT0tvFgbDCqt0PlFJ9Hrh0HwuYsymAfOUV6CLuFB89OawP70SONRs4UG7GoMHVgwcptFAdHOGbAD2nUB6+I7VTB7Db6necnSOHt9CCIeE13Z9/wZ2tq4Ire9DRKAfnw6+WkMpeVrpOGBXgNhrjLSbM+C4sAW18iNMU0/3dtAga/jXDbKArdKOkqeYbRmSPRgtsg4/+hBjezFdToFmBFuC4X1v3xunbapYlMlPiom7dTwTGQ1bwh9PwHlU4smrDUGlUoZk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB4770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(316002)(186003)(921005)(5660300002)(86362001)(64756008)(8936002)(71200400001)(6506007)(478600001)(2906002)(66446008)(8676002)(110136005)(66476007)(66556008)(66946007)(76116006)(54906003)(55016002)(6636002)(52536014)(83380400001)(33656002)(4326008)(7696005)(53546011)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mgxun+rV4A7UASJmVDwRAgbMIaxYszlyQx3TeUe+oSWmCWUvSbOvGSZCMp26?=
 =?us-ascii?Q?BQOmBai6xZ6KvcJwVATu/QsqyolSU5jalFhpwfyBB6tP6QiWGBTFpjjCd7AV?=
 =?us-ascii?Q?Pb0L48wHGZb4PfuJK13TCSd/QNakYd6hlk6T1hhNFTDLNxARovgdy1LfM7rV?=
 =?us-ascii?Q?RubrImyReSLP+MYj984wFD+9NqyZU5uh8yx6Ey7erdb34LuH3wNjJ3jX3ppa?=
 =?us-ascii?Q?Ca2SPJyTGB9S09f3oz0XTj50+oSNB4Klzkc5Z3HaS7QnJ0TY5beL0MgdBDM0?=
 =?us-ascii?Q?mt4tmTpdfuTIjS8a+6JBpQrtf3pyQsRkPPoMqMPg/TVFQjlLJHt4K37gJ5rZ?=
 =?us-ascii?Q?jL61Z15hV4D8MHRbC6QzAVgGYRQ9Zhz1bP3KwcW/lGMdPJSNiqIhutjRN01y?=
 =?us-ascii?Q?lTyKsxeTzg+dlLKvydzjb1NQvGwgnCFnmfaQ6fmGOt5TSiMIU1ft1xmQTXII?=
 =?us-ascii?Q?j3+l9w7dS6kLrbkidGpltsszbOWab0CV2RKvW/rc3gZHivXAcJb++MqX2Fxv?=
 =?us-ascii?Q?+VSBUIH5r1sdB7vp34mzNuEnHdXpyUCs8UpPInum8V1rNZN0b/ddXJBvu3JD?=
 =?us-ascii?Q?i3Guqo0K7DefBJqQeemRk3bySCExb1C7NhJerLNdZRPOmeKJmqNnThobbpAT?=
 =?us-ascii?Q?TCn2UEklHvbs/p6bdO/szY3X11r6A5j/iT9vN8lyGmDBbkijzNXM2jKQvn+x?=
 =?us-ascii?Q?uAvH4gedO4XOL4dl+9rHAHQ7Df8CE0nSpaZ7bqvM521uEYF9svD5XqtbCfQv?=
 =?us-ascii?Q?5QZdCIcWFPxlCMjSEb/zxKRFvQyZrCXAsG5J1OTvkV1RoQVtiXIcBosGESGz?=
 =?us-ascii?Q?e3y4aCHeQrZ0aTjR6lBIt6mzOfSsQ6kQqHDlh9YZatBtXJLSv9paMgKJ25Dw?=
 =?us-ascii?Q?CSXFY4+Bma+kCc1eJLAsUVas+hjbKHuPWGlaOKmQazvVY3NoGXknGL2N/Mnn?=
 =?us-ascii?Q?VPl8hKHxsvBdvfInjatIaSSnivjx0de84yHvXPfRynk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5ed789-1d4d-4569-cbe5-08d8b0b05da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 12:58:00.3407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKysLRTPo3sYsIVhsrJuPBHNCkC8U6qb5vYRR6KBMwerhIol9Pu7pGG404VRdmPrrIOdOdoUjyYf8/q7gl/cjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2593
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
Cc: "Wang, Chao-kai \(Stylon\)" <Stylon.Wang@amd.com>, "Brol,
 Eryk" <Eryk.Brol@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Thanks Arnd.

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

-----Original Message-----
From: Arnd Bergmann <arnd@kernel.org>
Sent: Sunday, January 3, 2021 10:03 PM
To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; R, Bindu <Bindu.R@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Wang, Chao-kai (Stylon) <Stylon.Wang@amd.com>; Simon Ser <contact@emersion.fr>; Brol, Eryk <Eryk.Brol@amd.com>; Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix unused variable warning

From: Arnd Bergmann <arnd@arndb.de>

Some of the newly added code is hidden inside of #ifdef blocks, but one variable is unused when debugfs is disabled:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8370:8: error: unused variable 'configure_crc' [-Werror,-Wunused-variable]

Change the #ifdef to an if(IS_ENABLED()) check to fix the warning and avoid adding more #ifdefs.

Fixes: c920888c604d ("drm/amd/display: Expose new CRC window property")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 4 +---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 42b0fdb72e7b..5071b55ad0f6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8379,8 +8379,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
 manage_dm_interrupts(adev, acrtc, true);
 }
-#ifdef CONFIG_DEBUG_FS
-if (new_crtc_state->active &&
+if (IS_ENABLED(CONFIG_DEBUG_FS) && new_crtc_state->active &&
 amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
 /**
  * Frontend may have changed so reapply the CRC capture @@ -8401,7 +8400,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 amdgpu_dm_crtc_configure_crc_source(
 crtc, dm_new_crtc_state, dm_new_crtc_state->crc_src);
 }
-#endif
 }

 for_each_new_crtc_in_state(state, crtc, new_crtc_state, j) diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index 0235bfb246e5..eba2f1d35d07 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -46,13 +46,13 @@ static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source  }

 /* amdgpu_dm_crc.c */
-#ifdef CONFIG_DEBUG_FS
 bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state);  bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
 struct dm_crtc_state *dm_old_crtc_state);  int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 struct dm_crtc_state *dm_crtc_state,
 enum amdgpu_dm_pipe_crc_source source);
+#ifdef CONFIG_DEBUG_FS
 int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name);  int amdgpu_dm_crtc_verify_crc_source(struct drm_crtc *crtc,
      const char *src_name,
--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
