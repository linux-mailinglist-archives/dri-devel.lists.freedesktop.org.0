Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156E5ECEA2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 22:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2879010E0F9;
	Tue, 27 Sep 2022 20:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34E410E01F;
 Tue, 27 Sep 2022 20:35:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsR/ZL1Ed4igSXLPi6T6UyQG2rbKQBY3OtEubQ1S37f4M9yrSwQs/nawmtlvzUeHRjQdo3D1qsX4c0+a5vqVrWWnNnCOozbIKZCaG/fyxhaYP6cx2Bki3/aSvcwmWa2wh3MHj4f0RawCNXz6L2V0NVEAlUFaM+SQ6WTPvjX4vPysg32UkuAH7aV3lSRv5ibLfgiyB5pnvuN8yaUzYLy8DPsXmxz3ScE1no+rIBoHmLpJIV1VFmb3Giw/x1iPum4qGbz3tM2WbpqxyscQ66lES3CCet0H1pJ9CpcVlS6u3YBHxkeGds6PgYi98ZNLK+MMfFE0ea7btY2o7NJpvkDZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVDKllhlfLCuK3Awt8okJOtuf1NL3XamGtyZ2zjwWmg=;
 b=SeLA8cx7xz+vI/0seBPHjsg/WIvlLs5cy8mFSISktaF3qDOuXsVY4venrXQX9o+PK0jFPpS9mOFJ2dmXDQJKWhIpHo13Y3SL+c6YK5NP3k1eM4/tUR0wSHTH52aVP/kRbZLF7fgO98klGLsCx+18zux8S8UfBlpJItde3jKrORrb1iuRGrGkzRD9sFLTFRgwNJoOM8sruEzKx3F06uM+5BehVoEusAb2iBMnaD24spqzGE0sbIkY3b4CNUR7xIZVnAu5eCFR6d2WggHQQzncd+cjmaFT2MO5LxGGpqH2B30X/4kyVB95JhvHYXI3wSOuWoNQeN5GMO3+/x6L0KpYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVDKllhlfLCuK3Awt8okJOtuf1NL3XamGtyZ2zjwWmg=;
 b=zOq7cEuctjgI9b9FevRjr0Vb3X1bI4j6gg8kM6RO3VBs0EHxbYuU3Clx/YwMiXM4ndPX5xo0igPysFo0l1Z+ktVPsWRldG1GP/Ci+/ZhLCPeXjmH0q+ME5tvASuAQ1QAq3n1wWg8C7f5KtDJQMkRJrBG3T6pW81+9zCg7NvO3Gw=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 20:35:40 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::cd37:1141:7fec:389d]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::cd37:1141:7fec:389d%4]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 20:35:40 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Thread-Topic: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Thread-Index: AQHY0qUDYQ6UPg7AoEWdYsKSRNwQla3zu/bK
Date: Tue, 27 Sep 2022 20:35:40 +0000
Message-ID: <CH0PR12MB5284EAC9E9D095B2624631228B559@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20220927191200.216488-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220927191200.216488-1-hamza.mahfooz@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-27T20:35:40.042Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|DM4PR12MB7597:EE_
x-ms-office365-filtering-correlation-id: c4582df2-fcf5-4a67-f9bf-08daa0c7d7c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eYxm6Dbx+QdY8aruAN15ywN7zsUNWMTaYedIvldHRxJUJQ/LG9qKZHWOr4yk/3mqtSud4n/tC/gMnxFRE/eNah4uJLkQKIn/4JJ4khnRXJWr0bEF9Tya5IXffZQkC2EOjLN7AW38FWi6Ur40H5JDgIzANe+cxQPsmVeWRY0xR74Ro+IsKujZiDUOkor1ub8+qa3+jU9SEyzgIkm6l7YbaMrMR7OcD2gX5oEGW7ZtpKd5sOVblS0vDd43wTf0R/S+kx3RNM88fan++gmh+ckg8Ychqn6rQEZwA3DNnPDOA+/DUjmTFGlu64GiGpXevWWrLSM29vKZ5f69NEASSmsev3FiFPsydBiV4REBGize8kVJYfwmZSef6P5nZvgdEsjHYYEH9KIcanxPArNg4UTqNKQQdOnnyPMTdq3/k1ueOl4DqctwV9fk8WCRLorZ5e91OBldYoFM/9ymvC1rRokkZRfNRANhj4nuVGOMQZBObUpn6yFRjwukymc4e0ip7wScQg+gM9ux9RZMyGgq7W3QUicCFl6YCqC6/4Ov0VhVwG1Kmf9yufuI7uVjuLYM+/ALpkon2wvqd3otRdB1CXWN3uvMi3UsqOt89gJtOp8yDfVI1eBry3P4uzPEuDsiv2zusIy0kf5eI/z2gqkpRgPRJk/gU5MbAsOukpLcmVX/qaRFXOguRy4LGnFKJ+rt85NxQnsWDT0Xc3h33HSpw/wA6ZjF2eq/Jko4GqYbTaUmkcHdG3UZ7v9OoUid1rX9P36h0Vxharpoqzi1supP6a/c1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199015)(54906003)(53546011)(478600001)(110136005)(186003)(8936002)(52536014)(41300700001)(7696005)(316002)(83380400001)(5660300002)(64756008)(66556008)(66476007)(66446008)(26005)(33656002)(66946007)(76116006)(4326008)(8676002)(9686003)(2906002)(19627405001)(38070700005)(6506007)(38100700002)(71200400001)(86362001)(55016003)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?0py3LlIj+wFJ4/Bdn4/OWbT56evnd7S95fHxr+B8bmMhNzskcCpriEZo?=
 =?Windows-1252?Q?E+qRAdEJTmqiibhSe0rBlE/YADACwI3M4uXEI7F4vGPZJvQqE+3FG6qL?=
 =?Windows-1252?Q?GjSeNrFPtGfcKdAl8/701zsWHMNa9tF6FeeCI18KX07zIQle0/KwBAc+?=
 =?Windows-1252?Q?NCVHRGq3OQdpFiR8iF/SLdMfTC5NxS2ZJe7rwpC5O9Bn3Io3AQnKjn1K?=
 =?Windows-1252?Q?pNPtGHbvRZLLg5MI2U0Nk97p0I3nf6D01RNuvg3QHljimfqpSGum1s6Z?=
 =?Windows-1252?Q?3KsEFgmFnI0qcFAvx9nsszD31/rTVu0VdB2rcTo+GPWJg7JBOtuQUwJc?=
 =?Windows-1252?Q?Bcxc4/gy+cUVDyRrQ+Uvhv40cp6Zxjx6shOzbXPPnpTOWrWBBdM6/xYT?=
 =?Windows-1252?Q?OhsMrbo6wBbRfkykeVpQdCnoppDq2Ck3D8ZeS9xf+N7znzc37Kh6Cm8p?=
 =?Windows-1252?Q?QfKWmgGF7PAG8gnDNItdaJFrDv7Yo/saMYa1lKEDri+Rs8DbemPBjU5n?=
 =?Windows-1252?Q?TWbrLCxBKnDQrvC8KHKvAigTi/Lrrz+NhdC1G4GUKzmYlhbK/BwkLuB+?=
 =?Windows-1252?Q?Om7WISem/5bOOUZCYJnKFIgjItXPaIVfmg5WRXoZlqvKVogCEcfb7xQL?=
 =?Windows-1252?Q?i0KllzXlxMMLSSJQkMgdCaqACXa6YkBre9FRxxIKGrzuptRWegfJ0D9K?=
 =?Windows-1252?Q?1yZQucFPCVTJxrdYRk5FxraaeUwPsl+oTZTG1mDBpL5fuhCD/noPTBxU?=
 =?Windows-1252?Q?2vW22oDNqylG+O4p4H68W9ZGtHMRpKpLEDOpKZGzFrBTZKv/CgVQ3T5H?=
 =?Windows-1252?Q?yDYdzkLZtW5sQfJk8S2c+9e+0iyLcF0cO8G79V2K8gmwpOh6qv1r54B9?=
 =?Windows-1252?Q?YBx5xvknTDBuoeC4ozETVBo/gbZzGoI4Uj5qf+NOBx0rJmQV8svb2+m7?=
 =?Windows-1252?Q?pdWmB83Dpp4uWztiFFdCUCFqfDDa0nYnVPU2eaqzs4ThGh7QW1zM92o4?=
 =?Windows-1252?Q?/KclO9I0/T8KXgiB0JO4XhuA33x4FWdTSfOy6uCH8egGQ+L8+rv9O+bG?=
 =?Windows-1252?Q?YOdgCcOXMDh8Y74nzyDs7mipIQ5KjOmtyUnE+Yd4ON4i1rB9UiVIJbvv?=
 =?Windows-1252?Q?Uifhu+Ph672/GjkLDM0Ty3QzZcz8bpxrQNlN4nJ2hbKbegiZTqkb+0FU?=
 =?Windows-1252?Q?DIa/9lYMOmtNAuO+VSiAk+nGIBiXZTCGyBhZAShPf6VRf/ouV5T1CoOg?=
 =?Windows-1252?Q?oUCJ3uwPQ6btrgm47Pas1nnMRK1H60Imf+ddzpIloNw0tQ+MCxTHZxL1?=
 =?Windows-1252?Q?xvikXQL4a0U5Sj+pfmhB9/HN2hNNGqZ4CfuRZmNIDFz18+NQXXL7pLAJ?=
 =?Windows-1252?Q?+ErSItFio5HNoXT9yFX8C3FxuE25J7V18Z/UhECRL/B7CEm12evauGXX?=
 =?Windows-1252?Q?W90+g57LVbQeDcKSnihsUztV1aJK0A2uE3QLgh5eflt6Y8sSfm8QPCOx?=
 =?Windows-1252?Q?ab28RrlpHbR5Aq0cycu3PiTxxUB9gzQtlHiPYsVJzTz4N8uyHNkN2HEV?=
 =?Windows-1252?Q?cXtSVMZWcNPAwCsHAthjGuyZYcpNcblMOX2z8qxAHqqcw4lH/CYYE/pK?=
 =?Windows-1252?Q?eLqe6f66/S50AU9ScYm6SprW57uwX6vo9ETjb6Z3kjAEusMgPtNYajwy?=
 =?Windows-1252?Q?+UzJKVj1h9U=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB5284EAC9E9D095B2624631228B559CH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4582df2-fcf5-4a67-f9bf-08daa0c7d7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 20:35:40.4718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8vJPPDZnDoqBD1AnKRa0u+Y4LLuZvOEoucXBRfmJ/+MRlSOZxEi/Vt34fayO9bxjeQ2MkyKuc32BjASRSvTdZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
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
Cc: "Wang, Chao-kai \(Stylon\)" <Stylon.Wang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, Po-Yu Hsieh Paul <Paul.Hsieh@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, "Hung, Alex" <Alex.Hung@amd.com>, "Lee,
 Alvin" <Alvin.Lee2@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Wu, Hersen" <hersenxs.wu@amd.com>, "Ma, Leo" <Hanghong.Ma@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Kotarac,
 Pavle" <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_CH0PR12MB5284EAC9E9D095B2624631228B559CH0PR12MB5284namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
Sent: Tuesday, September 27, 2022 3:12 PM
To: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Cc: Mahfooz, Hamza <Hamza.Mahfooz@amd.com>; Wentland, Harry <Harry.Wentland=
@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Siqueira, Rodrigo <Rodr=
igo.Siqueira@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koen=
ig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;=
 David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Lee, Alv=
in <Alvin.Lee2@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Kotarac, Pavle <Pa=
vle.Kotarac@amd.com>; Wang, Chao-kai (Stylon) <Stylon.Wang@amd.com>; Pillai=
, Aurabindo <Aurabindo.Pillai@amd.com>; Ma, Leo <Hanghong.Ma@amd.com>; Wu, =
Hersen <hersenxs.wu@amd.com>; Po-Yu Hsieh Paul <Paul.Hsieh@amd.com>; Jimmy =
Kizito <Jimmy.Kizito@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists=
.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedes=
ktop.org>
Subject: [PATCH] drm/amd/display: fix array-bounds error in dc_stream_remov=
e_writeback()

Address the following error:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function =91d=
c_stream_remove_writeback=92:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: ar=
ray subscript [0, 0] is outside array bounds of =91struct dc_writeback_info=
[1]=92 [-Werror=3Darray-bounds]
  527 |                                 stream->writeback_info[j] =3D strea=
m->writeback_info[i];
      |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_t=
ypes.h:29,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_=
common.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stre=
am.c:27:
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while =
referencing =91writeback_info=92
  241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
      |

Currently, we aren't checking to see if j remains within
writeback_info[]'s bounds. So, add a check to make sure that we aren't
overflowing the buffer.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stream.c
index 3ca1592ce7ac..ae13887756bf 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -520,7 +520,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
         }

         /* remove writeback info for disabled writeback pipes from stream =
*/
-       for (i =3D 0, j =3D 0; i < stream->num_wb_info; i++) {
+       for (i =3D 0, j =3D 0; i < stream->num_wb_info && j < MAX_DWB_PIPES=
; i++) {
                 if (stream->writeback_info[i].wb_enabled) {
                         if (i !=3D j)
                                 /* trim the array */
--
2.37.2


--_000_CH0PR12MB5284EAC9E9D095B2624631228B559CH0PR12MB5284namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mahfooz, Hamza &lt;Ha=
mza.Mahfooz@amd.com&gt;<br>
<b>Sent:</b> Tuesday, September 27, 2022 3:12 PM<br>
<b>To:</b> linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt=
;<br>
<b>Cc:</b> Mahfooz, Hamza &lt;Hamza.Mahfooz@amd.com&gt;; Wentland, Harry &l=
t;Harry.Wentland@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;=
; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Deucher, Alexander &l=
t;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd=
.com&gt;;
 Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; David Airlie &lt;airlied@linux.ie&=
gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;; Lee, Alvin &lt;Alvin.Lee2@amd.c=
om&gt;; Hung, Alex &lt;Alex.Hung@amd.com&gt;; Kotarac, Pavle &lt;Pavle.Kota=
rac@amd.com&gt;; Wang, Chao-kai (Stylon) &lt;Stylon.Wang@amd.com&gt;; Pilla=
i,
 Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Ma, Leo &lt;Hanghong.Ma@amd.co=
m&gt;; Wu, Hersen &lt;hersenxs.wu@amd.com&gt;; Po-Yu Hsieh Paul &lt;Paul.Hs=
ieh@amd.com&gt;; Jimmy Kizito &lt;Jimmy.Kizito@amd.com&gt;; amd-gfx@lists.f=
reedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freed=
esktop.org
 &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/display: fix array-bounds error in dc_strea=
m_remove_writeback()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Address the following error:<br>
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function =91d=
c_stream_remove_writeback=92:<br>
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: ar=
ray subscript [0, 0] is outside array bounds of =91struct dc_writeback_info=
[1]=92 [-Werror=3Darray-bounds]<br>
&nbsp; 527 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stream-&gt;writeback=
_info[j] =3D stream-&gt;writeback_info[i];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
~~~~~~~~~~~~~~~~~~~~~~^~~<br>
In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/c=
ore_types.h:29,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basic=
s/dc_common.h:29,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc=
_stream.c:27:<br>
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while =
referencing =91writeback_info=92<br>
&nbsp; 241 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dc_writ=
eback_info writeback_info[MAX_DWB_PIPES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
<br>
Currently, we aren't checking to see if j remains within<br>
writeback_info[]'s bounds. So, add a check to make sure that we aren't<br>
overflowing the buffer.<br>
<br>
Signed-off-by: Hamza Mahfooz &lt;hamza.mahfooz@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stream.c<br>
index 3ca1592ce7ac..ae13887756bf 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c<br>
@@ -520,7 +520,7 @@ bool dc_stream_remove_writeback(struct dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* remove writeback info f=
or disabled writeback pipes from stream */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, j =3D 0; i &lt; stream-=
&gt;num_wb_info; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, j =3D 0; i &lt; stream-=
&gt;num_wb_info &amp;&amp; j &lt; MAX_DWB_PIPES; i++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (stream-&gt;writeback_info[i].wb_enabled) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i=
 !=3D j)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* trim the array */<br>
-- <br>
2.37.2<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB5284EAC9E9D095B2624631228B559CH0PR12MB5284namp_--
