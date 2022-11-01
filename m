Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC48561476D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6753410E0E3;
	Tue,  1 Nov 2022 10:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2570210E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 10:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4fNHAFjeA42Ft69RMMYFNwWqi+xIl790k9Wc7/D6ZA+Nqq2kSAkNyL288TBQrsF3J2KNUNQPhxKLkw5O7FxVBSZN10Kt3gOUwWfP8BenWkR4ZR8iHdHJGrlnNccCekmHpNan94sS8UJ/y1jAa4FYmdBJoUwMdRdLSwKzS27nw2xxYamJNyvTHI+lzNsRD77ahJxc6B/1xGP8U/xM/ovtWwQ4hAbqJJ01QDNIkPDSIplWLhQzEhLpSnfhzgMiZRzX1wIeFFvSqpwx2G1cLaOMRCklxx8lxKRNm9gkDwsFTD9aKl6dFLI/je8lUzIsiI3DwaWJFdsjpflbuioUqWWYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+GatoSjycqbXjqB9SME82V0EHpo8AghMtUfzP87ano=;
 b=dgtBjYVh5M9dp9QmsPWhYB7HzKlS0XR7qU84eUaKdJFfSQQi+jAIyPfjeCvJ2evJ1D2T9DXmiEBSHFJNdZxDzK8+qhamZfvVf2xZj17cEw4Siby0v5bYs+zEpMcEcKuKMqYJaMbErFnMWdz+FL5KKJV4J+MlBPmeyIt+u3VTKyDjYtf9yF4qh20g7KqGsSkopBq3Wome93TkQcWteQeWOXBlnCOXvv9Yceb3/Sm1UVvojG/HyFcyiblO9MrCV9HqEAsy3lcGgpwVTdimb591Iqwxa366NDPJvjhJwn8MFg4I/6Udezh/9nGiiJR+1mjzAzAnzQrYJoqSlZ2iwhxizw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+GatoSjycqbXjqB9SME82V0EHpo8AghMtUfzP87ano=;
 b=EiBX8hri493/oBGMQi7sskjLw15XKLZXq3eVC/BvsiAeT0SWEklKXqgX6KbtBcZolDFDGHEx6MI6FbuWqwLLrW56oSaSoD7i7si2KOV24ZbuQkzzymIRZE0X/qdloTZdLHq5Zx6l0+u5J29CVJzfSWekKicrcel2/HJCr9T7KDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MW4PR03MB6362.namprd03.prod.outlook.com (2603:10b6:303:11d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 10:05:35 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 10:05:34 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] Add pixel formats used in Synatpics SoC
Date: Tue,  1 Nov 2022 18:04:44 +0800
Message-Id: <20221101100448.66712-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:510:5::32) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MW4PR03MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: d15f44b2-6ec6-47c8-f1b0-08dabbf09e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYhT6XY4bwzc8UWyGlk+0wPFON6KuiDGI6Vq1CTeH0/2OSQlZDrG8Y1Jrn3+Gdn7ISjIIx67x42Tp7b/LXt5Epk1EavxogHnK3noiPZV5AJ45KHqPWLAI5gaiD8DRyAOx0Hbn4rdumw2tw8Z7gmzDQcvd/QzDh2BGZJq+f1Kc6qy6CCOwnO8pCEmSRJvllhlYi9ewtb1UQQl3gLvNWyzKk+yvHkksz1/IIiKj5Px1TbkSYAwzohMMg2rn+MiYlbB19S6Z26seTvtDO3PE8ZO3NUmaLXRs3H0z2fL6xUycc0VPj+sbaQV9xW6tZ23I5ftHnYW2Tyn1GrLa7PAivD6ZJNKCyrqHRhbMgZ561LCpVpmpKKUF3j+B6zZZmFOF4l+m9qnhcYxyaeyqIR21Xga7YWh0Pa4euoVyNtN99+8/mPDA4kuIzMVZVaJ6yN/57EQwrCuAd5fvJZNvHDzXFBMkntCPwagX6owbrCK/Nw7JR80FZVmXIEM9WLDo+CqlxEWwfRGiw7DgSdVVBL7LLfBDLnETE2IMwqCzNjcAxtatJuZJ98gznsjejZmshPv6SdveycJQiQWokXXv19KiHW6dhZGPqJFLIZp6yTtLukK2c9z59UKSKwIatXK19V/85wbsmgnUxr2Yv2unspYAWWD0Ljl9SzQ/4cPa+qWmD/V7K7S3de6jQ+4S5E+ArjfeLFE2Aa0Nq/e8rhYqJoFlK/K6jFOmv5VByKKyskQ01o6e5cKqPD/1BswSMSReXrVgIldSgnIxVZQgiOiDGdf2axCEjqzO8voAGQve0O6vZEAmgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199015)(36756003)(478600001)(86362001)(966005)(6486002)(6506007)(66946007)(316002)(6916009)(66476007)(66556008)(107886003)(4326008)(8676002)(6666004)(52116002)(6512007)(83380400001)(8936002)(5660300002)(26005)(41300700001)(1076003)(2906002)(186003)(7416002)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DuWNtCXmRMRZhbFuElAaGqynOTd5GVY112Ou0BdJip+4Y35X+fFxqxZRxQRH?=
 =?us-ascii?Q?HvSdUB/lvKxnQ6t2b0oMmKLK0czmhRJoCnv5vhDstitXX+KX4nw5pxWCG7ZJ?=
 =?us-ascii?Q?V943KNyj30B2hkfQDz7FitRmIWpxeO+Z3dkoIOUKCfXIg9Bdyxm0Pcy0HjV8?=
 =?us-ascii?Q?bQ7CZw9hMwygLU38CNv6YtqSXrZGAzX/6A35rskKh+ZrEg9RACRhx3z0niQB?=
 =?us-ascii?Q?5GQ6Rhqv6jFgQfVZs7dnw89EbRert/syMojcVPsUedJTNfLCxois9RALWn2m?=
 =?us-ascii?Q?6pO7UietcVN8qQGhpFb8/TF33WGd4WW4OyvCbTawu1SF7Ci09C8CIHfMa+je?=
 =?us-ascii?Q?C9pOgReAjgU2NjkZ+CC5pZzulXmaVVeWu8P+7eXwv/7ApBPltRulQtuPCbBG?=
 =?us-ascii?Q?DniIs1JjyzwDwZUmeCB7g5OMCetHW7hhe5DaVhxGvYxhFKbVLZ/117Q6fd1Q?=
 =?us-ascii?Q?NqxKvWROG87oqPHs0a8X7J83fxu4cMb7iiAhel0D5+9fOyfNfvOpA9JBMiH3?=
 =?us-ascii?Q?s5QRL8p1AGOoePUJF0MQNi16kQVdN0nXvt3/2n52Pb7ijD25MqmyeZSLOVe4?=
 =?us-ascii?Q?mCmjzWXJ77KKdcEFyBVXLdAY4MJ5twzvwHfFl9k0Uz5piYVzoc/y7y+uF1sr?=
 =?us-ascii?Q?r02Us5T+OWfMpS8oAyYulVld8NT5Cb40norVpGqxBeHPDuWXW2aGuOjlOpwn?=
 =?us-ascii?Q?l97JSbzocFipQCdUtGiSHvJF8KiiJIKhLnnnlQqMRRseZ5sN87U6pSNBIFbl?=
 =?us-ascii?Q?pDJfKA/wLniourpTXbOHgpgkUzkYVJISRXrJvbm8wHGP1OnyAEpabhlVrM1P?=
 =?us-ascii?Q?TvN+xIKA+73+Ll7bxBucFfgcbaha0ufjN7Om87ArrzX7yCmJw/upDI7LSyyC?=
 =?us-ascii?Q?eNm9Pg3EV9jql5d4Tkc1b5ivgBbLAHiKAq++PjQVy9XP/gYgaLhUOdZAL3m/?=
 =?us-ascii?Q?upcFAjdN88/nK8HM4n41QiEPFjsbG+aGwoHMgL3bEo4Wn7WZO6OHB/+831Ty?=
 =?us-ascii?Q?RXEwJGs4Fl56FG+F9ehJr5roVp0TjNOurkRbMFMEay6CD1UC1WOH+n/fVCZZ?=
 =?us-ascii?Q?lUco5cIQJu6xjbjDxs4h1kCFQ1S6bDQYWoLynQCHBy8AspIML4MmfHghvD79?=
 =?us-ascii?Q?3niVdpkbvJ1EAvai0Qx87l5X3/3XySitds71QYUbRlFFw7QHzOSdCj2/D6ps?=
 =?us-ascii?Q?Y1gyOTBE6AUOwEir2a9TcWDFxYb1yXf1XI57d8mEhjKcVfGGJJzmyIfiGJYY?=
 =?us-ascii?Q?Erq1SqXrEA7Y9VIZ403mK6/wDdQ7SRGVLGne1OQjPDlUS2vEJkxe5za4s3JZ?=
 =?us-ascii?Q?+mRHM/8F4fP4IFtnOZD5C9MF776XC4gUB1UoxrDQ89/rfFNncj5L2pNQ0rL9?=
 =?us-ascii?Q?BF5tyzd1g2anSoZUes5ZtQmSrvX1fYBMvDXYpFM6uTRQSunKywLwoJMa/atp?=
 =?us-ascii?Q?SX8deVuTNiJQcjT2Hw+z7cliFBGDQ5/2kHtlV0GDPidmtfM76l/99z+1JW6c?=
 =?us-ascii?Q?Gasaa965hfUzeDi/iPynNNQZ4MyWNfgxIh9Ebx70hrKO63JNKMo0bjiXYgi6?=
 =?us-ascii?Q?e4EzA9mV97yenbqzv+8y/gKp0S+q6wJ9P2uLAlb7?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15f44b2-6ec6-47c8-f1b0-08dabbf09e00
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 10:05:34.7190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuQWynMoFjFco30w8CMkF6O9qc+6BbD0nODEj4/6ldY+gvb9jCV1O9YYQZQAWM1DMDfWvoHXrsZL1S1CJy88SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6362
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
Cc: mchehab@kernel.org, sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
 "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>, helen.koike@collabora.com,
 sakari.ailus@linux.intel.com, ezequiel@vanguardiasur.com.ar,
 jszhang@kernel.org, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 tfiga@chromium.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Those pixel formats are used in Synaptics's VideoSmart series SoCs,
likes VS640, VS680. I just disclose the pixel formats used in the video
codecs and display pipeline this time. Actually any device connected to
the MTR module could support those tiled and compressed pixel formats.

We may not be able to post any drivers here in a short time, the most of
work in this platform is done in the Trusted Execution Environment and
we didn't use the optee event its client framework.

Please notice that, the memory planes needed for video codecs could be
one more than display case. That extra planes in the video codecs is
for the decoding internal usage, it can't append to the luma or chroma
buffer as many other drivers do, because this buffer could be only
accessed by the video codecs itself, it requests a different memory
security attributes. There is not a proper place in v4l2 m2m to allocate
a large size buffer, we don't know when the users won't allocate more
graphics buffers. Although we could allocate it in a step likes
STREAMON, it would lead unusual delaying in starting of video playbacl.

https://synaptics.com/products/multimedia-solutions

Changlog
v3:
There was a mistake in format macro.
Correcting the description of 64L4 variant modifiers.
v2:
The DRM modifiers in the first draft is too simple, it can't tell
the tiles in group attribute in memory layout.
Removing the v4l2 fourcc. Adding a document for the future v4l2 extended
fmt.
v1:
first draft of DRM modifiers
Try to put basic tile formats into v4l2 fourcc

Hsia-Jun(Randy) Li (3):
  drm/fourcc: Add Synaptics VideoSmart tiled modifiers
  media: videodev2.h: add pixel format modifiers
  media: videodev2.h: add Synaptics tiled modifiers

Randy Li (1):
  media: docs: Add Synpatics tile modifiers

 .../media/v4l/pixfmt-synaptics.rst            | 80 +++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |  1 +
 include/uapi/drm/drm_fourcc.h                 | 75 +++++++++++++++++
 include/uapi/linux/videodev2.h                | 50 ++++++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-synaptics.rst

-- 
2.17.1

