Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB348D12A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 04:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB8E10EE81;
	Thu, 13 Jan 2022 03:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC46810EE60;
 Thu, 13 Jan 2022 03:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMJB/WSXfMQCyN89EZCsf8OSTKG3xks1hQf6pr+xjAaC1C956Xaj22CQxtLXB6BAruAwIx9Jr4RbzFvx2W3QNSUOBWZ1v7uRYtoiXrHWvfVx14h+zdbv9cygS5aR4JDSK/gQiBJZmHetPVCzMnEgQWnnPy6/+lpDADCfyoON9ncurpMpyIeqiMl0rLu5LehzSKjMywli2BX4ZhTT79lhE1Ci+8/XOHd0u563wwdMQk0nhQrSZX1SlPL7kJvbV3J8+lcMHrHI01fuxJNUd+d6ndC3hqbXhBJZGn+dewFL0e23M+LeRmrvHHRe7ErVbz8zDCLEyB1AoTTHjb3djffoBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqk7QpERLFHAn5YD9aZh8WWVRomSZTh6FZTUHwtjRHk=;
 b=iHiV7zQTalDRncdrgPlK1b2izc/A3uZaI/xTr8IYFU0RayC2lZa8wAWjcTfQ3uIaaVwgsQjqbMYXeSgP8iDWSnWGp6KxUk1sz7DiK5FiV07fNV0kYFNBXcC1UO6at6PS0ge/eQu6LS0laKsQIQ/4TG8gyj/3i2tF8VU38zjAez03MSTBu5bQA7apC79K9MwauVx/Bm7TulWBebADaI8uZq6PVd6RprwMSaRfpOELyBP0Yve/PWooNmXYZfFpYz949TyuuusQpcTUTfq1yDM8Zov6U4CckSX5iDrsLJX5Zhgb5y+fNmay5tMeXdxvnJuRVRIHVib1okhmbYm8psp+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqk7QpERLFHAn5YD9aZh8WWVRomSZTh6FZTUHwtjRHk=;
 b=Z7lnOebgrecq3GHr5yaum8oGX41OnTl2n0z4wyf4OssMffqY8GDfz3PS2qNW2Qx+r12GJz/BMQAiGEP1PNqar7PW9XhX1tZPuXFan99OAvOoREcx255tEE454MbEPrzskgfX5/+pknvgSc6v0YVSz+1lTb+hHmA60AWaKGosOC0=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 MWHPR12MB1214.namprd12.prod.outlook.com (2603:10b6:300:e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 03:59:35 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::1500:4b8c:efd6:672]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::1500:4b8c:efd6:672%4]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 03:59:35 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Yang Li <yang.lee@linux.alibaba.com>, "airlied@linux.ie" <airlied@linux.ie>
Subject: RE: [PATCH -next 1/2] drm/amdgpu: remove unneeded semicolon
Thread-Topic: [PATCH -next 1/2] drm/amdgpu: remove unneeded semicolon
Thread-Index: AQHYCCJlveE7LDa8jkG5IH62Ncxux6xgUs6A
Date: Thu, 13 Jan 2022 03:59:35 +0000
Message-ID: <DM5PR12MB24690F147E97557089106414F1539@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20220113012150.87399-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220113012150.87399-1-yang.lee@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc1ebe09-f9a4-4918-7269-08d9d6491cba
x-ms-traffictypediagnostic: MWHPR12MB1214:EE_
x-microsoft-antispam-prvs: <MWHPR12MB12146137A6646E2D8589AEF7F1539@MWHPR12MB1214.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ncgn+CBknkzvPQJmNpQsVHhWmTrr3rk7tEJrDXbqmR21B2pf+5TJGTLkuHVj9S4bkQAA0Ypl6G/2c64idJR+wxTooxprTX2s5dOJn82BYSTcveCyFTMLoSNy3x2gdOOEYLPO10Op3GES8WKr2GM838ygCpTbWFdvY9qdIHR/kr74S1imMjavh5aQoLbKw/zL3ttmX8e9Hrv9h3jaEaMNqzbQPPHFVoqGHO541UVTvRWMIger9xK4Xw0vUQ4oPDK/3a7KiP2EedIdD7pNn9lHMF4HB6ALGY4iChSM5+R6s4gfZ3eAElciBNnKOji/1TXgWKieVlX3Kp4uHI5fSBu71DKPLD1fK7GQ7rroVAW4uBld2kNWfv6LTVK2bvkykV/MO3LWFWvMOCOMJNUra3eHYuVNZHKmZkr6rC/S45MC2rC0hp4iqmZjHZ2cuTuXHTr3S00oic3ONbrSH0YmLbBF+i9EprNUiteg0k8jhSB8vTHZ785q5CL7hs1rC3WxKsNV+kHvlRnLZNGRH3t537DqFSyRy99xQimvokeO3TxkjCI28NLmlFXEDFmxDCfvb7EVJqoCgvo70StBd1niKP1G0WFYDWSZso55SvEaVLEQyHhfdavlnmZGd9zRmvNrlMwGsp3FkKqMIKE65i1xvCusq+FaCA0UCMiZv3uPt8rdx0cGEPjOFy53QX8RNjRpJJD3aijqF70+pCYH+gjtYuqiQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(7696005)(86362001)(66446008)(64756008)(66476007)(186003)(66556008)(52536014)(66946007)(9686003)(2906002)(83380400001)(8936002)(6506007)(508600001)(53546011)(110136005)(122000001)(4326008)(38070700005)(71200400001)(38100700002)(55016003)(26005)(316002)(5660300002)(76116006)(54906003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?98ozMXD44ykZYLfL8rTLMA6eog49K/WMGs58VzXXecVG3yM1Pwepo6agXOcg?=
 =?us-ascii?Q?JE0437vq4ca7uq2LV7/nE0QAvhIi0UjWfmf2tK9Wr/ot1ZcIfJ3NbTWEZVuQ?=
 =?us-ascii?Q?qCE9KF9NL9BFJ31pq7xki+CpGnMS8SP7GS9eU/Tv95EYrWOsSykR/qMbgF5t?=
 =?us-ascii?Q?trMiA4ARw+h1hiqBi1ZBodfArPY3+MiyfkfPMzty2cvO0HUQ0Mb18rqJSh05?=
 =?us-ascii?Q?xwsvxIFA7Msy8NZ5foe6MtF7P2RA2+qrNboYtVkDSXoC+sLjJXAk9wsVQ83R?=
 =?us-ascii?Q?+qxs7xmP8EIO/WJmLEC6Tnp+jesEWUpJuOFTg7OG4WWhzNEqFbwZqX9F1IJj?=
 =?us-ascii?Q?jsDgykC4q1qu33supH19IcLykc7SFQOUT/n3134f5TUV/DKyLJKHr64QyMpN?=
 =?us-ascii?Q?foiXnbaI3VuHJ30Da5onex3t+EnbM96CGskeEz1Nr1hVtUYD/Q6k0BvSrcMj?=
 =?us-ascii?Q?SJyir/hOq4fPuJuYKDPWcqSOAqTgfIhGpl1QXIf3spnzm804mCchDHjkOyDa?=
 =?us-ascii?Q?4C2JQW0UhA3wZK5J2oA0KHGz8CvQCbEKL7J6yVN3TMag0PJ4nlAsrDy1avGx?=
 =?us-ascii?Q?5l2WVuiff6R32ZUv5p4+sIkVCZXM+VbvqwDwZpAKBKZZbZwMrg2YcQ32O6qZ?=
 =?us-ascii?Q?1xPU73M7yT+OuutNU10VVhSVr7J8gnRPMBcZjPc9S5UgUsnLuoX0pwOy9s4d?=
 =?us-ascii?Q?w7RzmR0tjoX9P5926p8uwstkc8LM+d9NipImrOojKeKBZY9o9XlFRhqrRE0S?=
 =?us-ascii?Q?4V9WbjqV8iOzIFhKASo6C3dtgT6BWPmZ42i54wkbV9K1ou0YyEpZaQBfOjfb?=
 =?us-ascii?Q?reLs9UxrNN7xYjNcrF2jxFwJ+tKmjw5GRvwmgUc3mKZiJ3kw3yIbD4AZuQRA?=
 =?us-ascii?Q?whzLXzs3eP6JR1TzPPmP8dqoQP7mrJyug5T+19hR6XHsD8012ezAJX5qaZIz?=
 =?us-ascii?Q?/dKBtMqA0qUkUrSIO+GAav4KO9w0tBvi/Tu1sbSzNU3kid0vha26rFzPvcju?=
 =?us-ascii?Q?DxDp7RRGn+jl7inM7pWY5wMB0/lbCxmKXi1kEyrUh79h9nLG/pQsTBjGnoO2?=
 =?us-ascii?Q?b5kkXBFttaFWJYtG76k70akffKS90ybJ8r7Td6rNhoFv4qRipgU600qTIUsE?=
 =?us-ascii?Q?NxPVVLV2ykuQhipi7GtViwEFQeFwgyAZALQ2yVIlRah+0VWZRG9fto5QjIbf?=
 =?us-ascii?Q?A8SsoHnR+z/Jrr+R2aY1XLJNxjM5v85mvAfVVcRxXgNIzEHaLw6bfeyOh1qv?=
 =?us-ascii?Q?jQtsC4DhDkQMnSn66vYfDauxN+t/37mh2xBWtaqm9pUHy7wuJNuxG+u4Dbmw?=
 =?us-ascii?Q?g1enElLo9SYDTiuXSim5SVV8GjWX5WWiLACYVfW0cu92bjjjSlMwGiRXoCEk?=
 =?us-ascii?Q?YSLuCrFcbhUX0bzaEi2YJ3cPRDWw/AsENMk8WYR74kOmoatXl6SxxTBQmVhR?=
 =?us-ascii?Q?jHSnbLJaZ4AJLDkelNlCKYtCeKQQ0l4rf74fcwxDe9fkJHCY37cf3J4TpRFv?=
 =?us-ascii?Q?+xM3MniNpK8w/TQ5rjdst+4C/HvwAREw3ORGHH+bCo0gNI2S7BSXo7DMYvdp?=
 =?us-ascii?Q?NG+VkJfnlHTKdamPz5J4rSS9JmiY/sABq3M0LqY5tQoaWLCIRLk78XO4Pzfa?=
 =?us-ascii?Q?lvcGw0v1bIxKaAflOAu2+nQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1ebe09-f9a4-4918-7269-08d9d6491cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 03:59:35.1323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPrseLGUhu8wVffiIcr9U8MgwzHf/xoIMw4WwAUQjzIY08eeGU1ynb1YOJNPzDwgjLgFNbmPk8rieXi3kFyLZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1214
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Abaci Robot <abaci@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for your patch, Yang. Can you pls also fix the original indentation =
problem as well?

if (!adev)
-	return -EINVAL;;
+	return -EINVAL;

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Yang Li
Sent: Thursday, January 13, 2022 9:22 AM
To: airlied@linux.ie
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>; Abaci Robot <abaci@linux.alibaba.com>=
; linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Yang Li <y=
ang.lee@linux.alibaba.com>; amd-gfx@lists.freedesktop.org; daniel@ffwll.ch;=
 Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christi=
an.Koenig@amd.com>
Subject: [PATCH -next 1/2] drm/amdgpu: remove unneeded semicolon

Eliminate the following coccicheck warning:
./drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2725:16-17: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index d4d9b9ea8bbd..7d9d99e581da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2722,7 +2722,7 @@ struct amdgpu_ras* amdgpu_ras_get_context(struct amdg=
pu_device *adev)  int amdgpu_ras_set_context(struct amdgpu_device *adev, st=
ruct amdgpu_ras* ras_con)  {
 	if (!adev)
-	return -EINVAL;;
+	return -EINVAL;
=20
 	adev->psp.ras_context.ras =3D ras_con;
 	return 0;
--
2.20.1.7.g153144c

