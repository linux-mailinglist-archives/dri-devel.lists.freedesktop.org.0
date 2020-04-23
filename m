Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984EC1B5EF4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 17:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C286E8D1;
	Thu, 23 Apr 2020 15:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09CD6E8CE;
 Thu, 23 Apr 2020 15:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyvsPckLXVt+mqfaWvkXAv0JkFGIr96PTCekDOiARLmyWRYgh7bBFnflUeJ0BevgpWLnX2r61ZuqaQuoQRr9tHRumqpouC1zU98wCIx1ga3sFq/Rn7CVUigBh7kA3PLg2l2tBCsEF1TDGbdSM5AOo+25DE8f06lG5OqawZ7R7eEg1oSXTvngfcc6LmxsH0Ysicpp0I5mr8ELPNZl+GNdjkACP6D7yNbGkdcD1n8/oOdNKcjx0WoeA4uX4ApLoCELC0BAmtRetn6QPK2Ul1x3N7wa8zos4yHgHXy89t76sZ8csPsbkkfwW3gUbsFbdVy9h76piAXImNZHgOair3a6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcmhwNCxjK7dEr+92JeavpdrpIruY5oEORvnE5a4pUM=;
 b=DZMFUkktuSs1QLm9lWOUDSR2EwZ4vaA+n3LDWZOCllAWbdExgeRUshzWxdcO0zGTN2rUSMIrCEzDV1yoou0LJGXDt+rAvvrWaRL6Spc/35Dt4JSm0iwfpnW5u32OEfRZSrUUlQ27qNaU3393MBYkACpKSevJ3z7pqZAJ4XCWKQjHN/1/1L4OeuKJVGMAKXp23TBXgkuscXB1iwUTZmU/KhHO44uhbPsV7Wv6tOO99ESVI6oBDEcYVxPZd8hF6j8+QaFzpqvcd5Wjidf+8uxtALcxerqZDcDCPrbDq+lzzv4g/EPcSpRfdZa37UDOYW4uLzNArGJF18Mvk6PzVQKKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcmhwNCxjK7dEr+92JeavpdrpIruY5oEORvnE5a4pUM=;
 b=LCa13vlAmyRUEFv+CBF1VF+2ENVEuW/GrWygLULDF3RdIzWf0UCW/Ax+ZP5oQJ1SzpGG7StrTtY1U/ZvG+/xB3H0LE2/jMUhda6zDGiNCbdvG0xhg+5I/M4eztlbq+vvGTldh8H32+Ey2b4nvQA5vf43gdQBt9RsJUlkCbQikT0=
Received: from DM6PR12MB4545.namprd12.prod.outlook.com (2603:10b6:5:2a3::15)
 by DM6PR12MB3291.namprd12.prod.outlook.com (2603:10b6:5:186::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 15:18:56 +0000
Received: from DM6PR12MB4545.namprd12.prod.outlook.com
 ([fe80::14f2:ab:f326:5c2d]) by DM6PR12MB4545.namprd12.prod.outlook.com
 ([fe80::14f2:ab:f326:5c2d%4]) with mapi id 15.20.2921.032; Thu, 23 Apr 2020
 15:18:56 +0000
From: "Koo, Anthony" <Anthony.Koo@amd.com>
To: Colin King <colin.king@canonical.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH][next] drm/amd/display: fix incorrect assignment due to a
 typo
Thread-Topic: [PATCH][next] drm/amd/display: fix incorrect assignment due to a
 typo
Thread-Index: AQHWGXfcCvNW3AoRMUmTjU6+P3IpdqiGzUOQ
Date: Thu, 23 Apr 2020 15:18:56 +0000
Message-ID: <DM6PR12MB4545A35BA8D16B0218FF142FF3D30@DM6PR12MB4545.namprd12.prod.outlook.com>
References: <20200423140240.19360-1-colin.king@canonical.com>
In-Reply-To: <20200423140240.19360-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=9343ede9-6b1f-486a-8545-0000cf844351;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-04-23T15:01:43Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anthony.Koo@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 18eaeeff-6935-4fb9-57dd-08d7e799a44e
x-ms-traffictypediagnostic: DM6PR12MB3291:|DM6PR12MB3291:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB32919D7558E213871298BB43F3D30@DM6PR12MB3291.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4545.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(81156014)(8936002)(54906003)(66446008)(64756008)(66556008)(66476007)(66946007)(9686003)(110136005)(76116006)(7696005)(86362001)(8676002)(33656002)(55016002)(4326008)(52536014)(26005)(478600001)(71200400001)(186003)(2906002)(53546011)(5660300002)(6506007)(316002)(921003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5mH9bozma0sWmNFQsyQecF3xBTeRMDhUZQ6H82/U53XdLhKZ3zVRJQPNeu0hV7m65jXJjz4p2wFwGOhaPrvNQazpLznkeUxxNHc9HgdziSXGXF4uzJh07eg+pruWzqLIPNaEVIqYe/bGfy2j5MVEptt6hbwMH1aoCZfkcV+k0s0+58MYAnEhURncPu7D0qVbCZXl0aGpC0GOhjHXVazGcYDXByLNR+mVNod7W3duSGO36eZwwhouXD+G3WGkh9WCQEC0kuK5CzVlE3z89NFKYPPAEJV4N6xsHb+Tqhfq6R5aX13Qbhkt9bD+7yXahEy3bUd9kCsMwJ+cBUagBGeE+wnkOtokAp8ZGb046W9Z0+WnsJxDjsMZERFdp+pK9VZKAcvD+LPJUd3S6N4KddwImAoKR9WWYp1Sznm2hpYROeuzliZc8E+xV0ULkdxiiIPOy6+sv8gOroE+qWd1hYr29ZEjMMq7Hw/gtvy2/2VLQls=
x-ms-exchange-antispam-messagedata: 1jH8QHPvN6G2jOBdVScAwgWuGscoNtjLgURchqu5gUZd8+XbfSlRhZAWHKfgQUzA1fbUlaF6ARBMxCRnGbb4m0rk4mReJ8MAUJJIBFMfBKyN5WCy8QWQpIk4cta9hSqHyx+ezKhfz3aeUzTadsSwZw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18eaeeff-6935-4fb9-57dd-08d7e799a44e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 15:18:56.7988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wtky5W0zJvtXvfuHt7V0CdW93i8PI8YBSpENPdxU3wyL3TOsFE7qXwaUBDhmmwTu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3291
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Colin,

Sorry for any confusion of this code.
I think in this case, it seems like the comment is wrong (but original implementation is somewhat wrong as well). Probably the original code implementation makes it unclear.

There are three scenarios:
1. Variable refresh active, targeting a fixed rate
In this case, the min = max = fixed rate

2. Variable refresh active, with a variable range
In this case, the min = minimum refresh rate of the range.
And the max = maximum refresh rate of the range.

3. Variable refresh rate is disabled (The case you are modifying)
In the disabled case, we want to indicate to the display that the refresh rate is fixed, so we want to program min = max = the base refresh rate.
Today there seems to be an implication that max refresh = base refresh, which is not necessarily true.
I guess to make the code more clear and correct, the min and max should both be programmed equal to the base refresh rate (nominal field rate from mod_freesync_calc_nominal_field_rate)

Does that make sense?

Thanks,
Anthony

-----Original Message-----
From: Colin King <colin.king@canonical.com> 
Sent: Thursday, April 23, 2020 10:03 AM
To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Koo, Anthony <Anthony.Koo@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: fix incorrect assignment due to a typo

From: Colin Ian King <colin.king@canonical.com>

The assignment to infopacket->sb[7] looks incorrect, the comment states it is the minimum refresh rate yet it is being assigned a value from the maximum refresh rate max_refresh_in_uhz. Fix this by using min_refresh_in_uhz instead.

Addresses-Coverity: ("Copy-paste error")
Fixes: d2bacc38f6ca ("drm/amd/display: Change infopacket type programming")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index eb7421e83b86..fe11436536e8 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -587,7 +587,7 @@ static void build_vrr_infopacket_data_v3(const struct mod_vrr_params *vrr,
 	} else {
 		// Non-fs case, program nominal range
 		/* PB7 = FreeSync Minimum refresh rate (Hz) */
-		infopacket->sb[7] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
+		infopacket->sb[7] = (unsigned char)((vrr->min_refresh_in_uhz + 
+500000) / 1000000);
 		/* PB8 = FreeSync Maximum refresh rate (Hz) */
 		infopacket->sb[8] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
 	}
--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
