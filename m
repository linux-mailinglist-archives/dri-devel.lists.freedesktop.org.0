Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645D1D6E36
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 02:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAC66E15F;
	Mon, 18 May 2020 00:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4A56E156
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 00:06:55 +0000 (UTC)
Received: from [100.112.7.253] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-c.us-east-1.aws.symcld.net id 73/30-39853-991D1CE5;
 Mon, 18 May 2020 00:06:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRWlGSWpSXmKPExsWSLveKRXfmxYN
 xBqv7eS2ufH3P5sDocb/7OFMAYxRrZl5SfkUCa8aNxncsBVe5KrbtjGtg/MLRxcjJISSwjEni
 1LXALkYuIPsVo8SteU9YIZwGJok7DSeZIJzfjBJnj85iBHEYBZYyS+x8+BXKOcYi8XLGLiYIZ
 wOjRPevz2AZFoHdzBKXdsyGGjCLSWLns242COcuo8TLd+fYQQ5gE9CQmD97JguILSLgLnG5eR
 uYLSxgJbF5zjxWiLi9RMfpO8wQtp7E9T0rwOIsAqoSe5asZQSxeQViJFqezwWLMwqISXw/tYY
 JxGYWEJe49WQ+mC0hICCxZM95ZghbVOLl43+sEHcvZpRobFjDDpFQlJh/8BmULStxaX43I4Tt
 K7Hty0qoQVoS53rmQtnZEh8PvWaBsNUkep9+hqqXkVj2s5sVwpaTWNX7kAUm/uDGdnBISAj8Z
 pJ4tn4f8wRGvVlIjoWwdSQW7P7EBmFrSyxb+Jp5FtijghInZz5hWcDIsorRNKkoMz2jJDcxM0
 fX0MBA19DQSNdM19hIL7FKN1mvtFg3NbG4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwxaQUsCnsYNw
 0/73eIUZJDiYlUV7NRQfjhPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwCl0AygkWpaanVqRl5gDT
 HUxagoNHSYR3znmgNG9xQWJucWY6ROoUoy7HhJdzFzELseTl56VKifNuBikSACnKKM2DGwFLv
 ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM6gFzCk5lXArcJmGqB7hfhdb24D+SIkkSElF
 QD07qn396mhhg1z/1vt59vv4Vmef3OilVHzrHz+OcG/ea4Jv3+ue3q5deynh6cd2y+R2Pb0Tq
 VHUY/dvGHe/vnnivmj+x4kzL/5o3cihnr2aq5U9k6b73l3s3onXFM7ekR9299m6fLHF91fulP
 +Ziu2q6eVuEmcReHZXIvk24XLl4T/GbyIR3JSW73M0sXaj6KcdAszVNTcbq4ObCNp3H6/6Tuk
 BVs4cqz3rVvfHb9hn2ew8drVWsrFX6a2fpHPnj+9qq7OGvx1mucB7bpGUx868m72jrIV2Xtr+
 nZ+jnMDzu12JuneJtt6IkpMLrI+zPiY7fQIfkvC0/pKflrTJPYfyyBbcKx29khIWd3WIsmKLE
 UZyQaajEXFScCAIgStks4BAAA
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-12.tower-415.messagelabs.com!1589760406!333597!1
X-Originating-IP: [103.30.234.4]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25762 invoked from network); 18 May 2020 00:06:48 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.4)
 by server-12.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 May 2020 00:06:48 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 7601C69C93DAD6864CE7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:06:46 +0800 (CST)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Mon, 18 May 2020 08:07:16 +0800
Received: from HKEXEDGE02.lenovo.com (10.128.62.72) by HKGWPEMAIL02.lenovo.com
 (10.128.3.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5 via Frontend
 Transport; Mon, 18 May 2020 08:07:16 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.55)
 by mail.lenovo.com (10.128.62.72) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Mon, 18 May
 2020 08:07:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnbP/7RsDGgsI0UM9naMVAqXA7SJ/NIgtcoBGB5bWr5bzVq76nRBZvXH4QB5MyfYyaujlieaORwhX/IbM3s8lEsvyhsskAHa6c25IMEtRS38KchjNo3Ufez0g5nhzi5doRTyTZmAsikhKJZvaWuXioWhuV6QSlwUFrNTkw78w2BARuHe2gkBE3KpsAxzaFGOVq21n7ydZOA4hMnT7ysS4lhlFIQ7S6JTstM5309CeHQ7NqX8KIlDxT5P9ffJJc+XsgUcwHVjzd0xSbzJbRig3Au59YM5b/yd+39QL23+atqj7ig5WRrCpa1LXyvKsJMdz24Vau7iNRWjUeSrN+I/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABlw/mJodEaLmsr55FbmmePS3r7HKJ1DrUPGVpupQDM=;
 b=DQcmhdRBUa3E9tpE7+JpVg9G04xbGvjA0UfOvhk8OVylKkSVC7dS+ga72Mr4/+PoKcu7NIXcXFeLbKctQJ0LbmblZru6JxtwbtzBvBT4/iDqU1RBNwYSvBld7FbKowBguruyF1imfxyCYOTjXTwC1K0flZC3+IDkCpen1JOBNWpI4fvBxX9LrGwFWergZ456QVJomzuW8qQnG4ZYX/av6E9sMIEoXjp3KSYhGx0BVhkfYg/RLVrpRTL+8Fxs5EEftPEsoJzhMBeMPQsuazvwUdiL/+9mi5X8pJgfiAcn77t2Rkvd+KtFVCNyBbb9MhHbrjFCbYLMzK7qu51BYSVCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABlw/mJodEaLmsr55FbmmePS3r7HKJ1DrUPGVpupQDM=;
 b=e2/eWsw0INLJdFHrwBkRekI5AO+Xiink06x7ox6T50MMj2I+JtsGcdtJ047rKYNMBM8FcJwpvDSyaWXHi5f7NxhLyNS+5iPHz56lP2ucaUjxnOl0U0WWDFMndexVhQM8YtO3LdJRFXHFEZPGelF0joKhhG6wyHOBgNHellsnX4o=
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com (2603:1096:4:19::12) by
 SG2PR03MB4518.apcprd03.prod.outlook.com (2603:1096:4:85::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.13; Mon, 18 May 2020 00:06:43 +0000
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6]) by SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6%4]) with mapi id 15.20.3021.019; Mon, 18 May 2020
 00:06:43 +0000
From: Mark Pearson <mpearson@lenovo.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] Lenovo X13 Yoga OLED panel brightness fix
Thread-Topic: [PATCH] Lenovo X13 Yoga OLED panel brightness fix
Thread-Index: AdYsqBX9bu34e8dkQ/WSWfP8hYJvGQ==
Date: Mon, 18 May 2020 00:06:43 +0000
Message-ID: <SG2PR03MB3324FE6FB77A226167E9BC31BDB80@SG2PR03MB3324.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.48.229.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44c3cd81-5ffd-47a8-c629-08d7fabf58ef
x-ms-traffictypediagnostic: SG2PR03MB4518:
x-microsoft-antispam-prvs: <SG2PR03MB45182E86FFEE1900CE9CD7FABDB80@SG2PR03MB4518.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gwxnZGShqiUpZE10IpcYJ+RsCzYWdWsocVU2TmMTIUmKFuY0cQt1SSsXlkCaosCfYcgaNj8kSMll1X68lykAPcfFqkFxQx/mnqQCIWRCL7DmTAgtZVv7GBbzvw0fGUqH5o4Zx3yxfCSc6M5S6nb4VeDK1UCCeGNeFQqiT7X2njx2nwQ6WV65+Hm0abmdyA7NV4ePME92SwvZJKf3DRGGcBnbhoNDTmrBbZ09EwTafP88+MHBVjBGoRm33mCiSBWIceNrUgfPmz+/htF2g16nosriWKNSj9dn6vgxE1OnO4rd4Ms1ew5DOEMXWuxVy4CkT6cABVhBkgaNBGOECfujJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB3324.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(346002)(396003)(136003)(39860400002)(478600001)(33656002)(52536014)(6916009)(86362001)(71200400001)(9686003)(186003)(8936002)(6506007)(76116006)(316002)(8676002)(55016002)(66476007)(5660300002)(66556008)(66446008)(64756008)(7696005)(66946007)(2906002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lHTCzc9QWOC+M6RQseI0gGc36DeIiIooB/cdAxzQEOJEMle25WEMNxJ+POFnIC3ABhGm5OzxzKSq7RnbQSlfivQOgh2bF2avnOoPqyRY5SDQmFI28BqJyozDs1nzj9u8gndwOtZTe636+P7LXE/zf0HbV4P2mBsfYwLSko0KWccP9A5BI6HavFT/NxTk/YE3E9Jb10Uj0coq0tJZp7q2ccZ8CvhAiFa+B0JAZrhxu34ba12entU7opDF53fUcJpNLgM0gLbGdpBerOcmT6yuonOkZ2hSsk4dzzkrCHCy3dktWvX+m0CpGp66CxEYDDrur/YQl1p6zkeH4byESPRa9aXyVXdnR7X2Nmhg2iMrXKYwcHZcOcWsdE0ZW6wfnIfDWz9reYvESxVJp7X+X32xHNsreITP75OSSiOMHtV6q7nJ0D0aha+5s1uTsDRIkaJjWPz9vSiqwWyDYUy6SW8Ms6xqVpohhHFC3YPcREabbuI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c3cd81-5ffd-47a8-c629-08d7fabf58ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 00:06:43.2321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tbOPWXQ63zuUcPp250+LhkqtXoXHDdnVq/L1wZAl5trliGVvBS1vZLx7cRycEx6i1ihZFmLZPvtzlXD+zCTNaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4518
X-OriginatorOrg: lenovo.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Patch to fix an issue controlling the brightness of the OLED panel on the Lenovo X13 Yoga 
Please let me know any feedback or questions.
Note - apologies if this message has shown up before - I had some mail client issues.

Mark Pearson
---------------------------------

Add another panel that needs the edid quirk to the list so that brightness 
control works correctly. Fixes issue seen on Lenovo X13 Yoga with OLED panel

Co-developed-by: jendrina@lenovo.com
Signed-off-by: jendrina@lenovo.com
Signed-off-by: Mark Pearson <mpearson@lenovo.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
drivers/gpu/drm/drm_dp_helper.c | 1 +
1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index c6fbe6e6bc9d..41f0e797ce8c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1313,6 +1313,7 @@ static const struct edid_quirk edid_quirk_list[] = {
               { MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
               { MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
               { MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
+             { MFG(0x4c, 0x83), PROD_ID(0x47, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
};

 #undef MFG
-- 
2.26.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
