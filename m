Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6CB5828F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 18:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFB610E515;
	Mon, 15 Sep 2025 16:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="lKXRkmUp";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="Sghgowdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D2A10E515
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 16:51:37 +0000 (UTC)
Received: from pps.filterd (m0187215.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F5a67h012202;
 Mon, 15 Sep 2025 09:51:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 tnHEy14BRKlrIC9t/sW43scxj0gGctbTynT/G2wwXmg=; b=lKXRkmUpsdYqorVI
 HCA490nj1ZFQDHhd6FI79VloJQbM330fNoe4CeRj8DxOA9wUKJXgMFOpK1l7WKVZ
 I/cilUe79jDz5vaU+StQglSaf8WbTdCfWZn16bQ+bD1RqpNsd+ccFtlob9tMRy6U
 yPWeHb6i2mW6zUGfjX9JHqCuLz1lteweKhwsff/GDpfWk7ZDKKXi1M5uk/ixwfZ4
 y0xNdlUQH9XJqPWwb/btlkER3ixXW1QZkQ0qJxjxexChNES/BF5TmcbLziAPJ1cj
 F6z9Dt+FVSMMtTX1RSBmmNMe4sTe/oZtmUKdKoXFKz6Q6mRjN1qjq8uilqZD16KB
 1UQFeg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4957wmuer4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 09:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRqHMO32w+RX+92wbOQ8e3IPm9ydDeUSA2aLmllAr4r533eixABwXsumY/rm+hVUjMpXz8GNca3lWgvU6k0o6qEWiq/pf3WW1tLZsk7Z28M5KkMqP9r9lCN0V1r1DqntG5wXlZcWaNMKtqRgX0CTKGwqe3uasGAWuUBVOQrdYJUWqUNdPNyJiUd5lAYLdV1XBwNQYiPH5wKY8fa6y4w/EJYURqBqTu1JiPs6U64YUC9NDpMGkrlRtcT0uFFOAjvdDxuYzGEkHZtTig978u+5lPj499zOFmFAXKnTPdxQKEGp16boSM1sAHZGA/3HEmHfZkF9nyrLRSJ5hbXIAgZu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnHEy14BRKlrIC9t/sW43scxj0gGctbTynT/G2wwXmg=;
 b=BSTUDdM+TWewrviB/KP5Ewl/5Kz1UvVuyedgyJv1XYEDfxub4G1GilYU+Nw/Y/loDedqD1R8HxcdtwNtNfY6eD4xE2GjElEGXZX6VqzFjvWSoKBvzyuA0JLkcYY43xr6NJVWv1v8Rxt9DleQMZzZtIJcvpMe/zgSJOvwYRquBznl5wwtbl3gphv5yzZK8t0KPAXWZyaHVzPbtln0Ya+ZZlaHAGS/rZKGKnu8aEjWcEW7dvEerrfP3YMAYVU0IVV+zvWjsewBgxc7vJ9C7dYJ8aQjUoab7oQtnL1NmO+oVFB0YXazWBUVXJkrFH7/nokMWAZQ5kGkFY3G/x/iE+Cc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnHEy14BRKlrIC9t/sW43scxj0gGctbTynT/G2wwXmg=;
 b=Sghgowdrq7MSnPGfKWRjBGu42KGCNVgTF5iqa113S+/N5Hq5r09GTNRTKeBDzaIpn6kJ1BTHADZGY0zfsNmvBCliJ0UCBe5WaawXHBjHuCAIKiuQw9HpfjJ5gVhl1g9zKgT4MixF3DLrpqkW/lbX60yMzKpVmcfzLwSEeqeP650=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by BL3PR17MB6089.namprd17.prod.outlook.com (2603:10b6:208:3b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Mon, 15 Sep
 2025 16:51:06 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 16:51:06 +0000
From: John Ripple <john.ripple@keysight.com>
To: john.ripple@keysight.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, blake.vermeer@keysight.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matt_laubhan@keysight.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: [PATCH V6] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode
 with HPD
Date: Mon, 15 Sep 2025 10:50:55 -0600
Message-ID: <20250915165055.2366020-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912210805.2910936-1-john.ripple@keysight.com>
References: <20250912210805.2910936-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY3P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::12) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|BL3PR17MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 2325d7fa-defe-4e78-e57c-08ddf478105a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F05gH5oe8Fjv8s5f1aLaxO/ikXy/1jod4CIzWMJjgCaMQMNGMf0UG/Qig4cD?=
 =?us-ascii?Q?MyGtgqngdUQ3cMtsKV59bg357ZbbyfW6iCJjFAGlFV5tvTBW7c0LQLVMYBHI?=
 =?us-ascii?Q?vv8njYyYvh7YIVq3FEm4Ckv+TQvhn4iiUlsiLLhDzNP4CTbuLa+GBNMFYN/U?=
 =?us-ascii?Q?jBdEiiK2I5xMzUquQX5gEcYJDqAy7EFqNq+zgRD+sZ2TXgBp3MEqJYImn6VD?=
 =?us-ascii?Q?t2vTFR4CAS0WemSVYQ5vfuIKYHYP0XT14X7KmgGGqiOdIYOqfTe8wIicQizd?=
 =?us-ascii?Q?id9zl573wqIv2BWZ8oG6Zn9aO/WKOCzT8+puYXQ0pKRyVTdN7fZG/cCaq8H5?=
 =?us-ascii?Q?AUNPTLYqEvbPP1qVyZqhZRaXCia0qVn+teWCfgXzio/Z7Yx1Td1BIBdPVRHR?=
 =?us-ascii?Q?uyJRvJyGruHjsPF/wZmm5pyMhNKhRIfeaSslSpKOeCTKVkO+21l1qqWs55NF?=
 =?us-ascii?Q?DUoh6VKEenMbSlBXbM/TNvGjy4Cxq4QyGpuJLxpsEEmkARMAmSbcKMfmHQdI?=
 =?us-ascii?Q?Snqjkr+zplYSFG7UbOUMndSTk8ROuu0WkS+KIeA5p53j8SEkv+W6O/d2qSH3?=
 =?us-ascii?Q?BZWwUlv9SK0w+VUv0XXn/DCUD6kPFnCFl4fGhTsLJXTFrm92So1Lyr1yEsF1?=
 =?us-ascii?Q?mmft/kgq5JCwgJ6pO/xcmYo79onOPwsn7MOYS2pMdMj4zn6tF/yICX9qd41e?=
 =?us-ascii?Q?LM8wwgNKMgZR4UAy9AuV+hjU4iZ3PKfPfww4Fs3udE6Jy3CTQZ3c9iyXH1m0?=
 =?us-ascii?Q?dq8hDHWVpwq4ie/xjxkdCnAOrOKgBGfsUSoQEvM4lVyxhKVNgdaiymj3wEWP?=
 =?us-ascii?Q?OYKpTTrFSZxErrEZilaG0o6eNPqKxAZsHl5ic2d938fJLTPRTyvW+d/lFE2e?=
 =?us-ascii?Q?+1JKWQ5QCJa5mChqZbCfqx3SFpOzp2TEix+3hUSlgqZKYVBVLfmKoELAwl85?=
 =?us-ascii?Q?0qUri8mNxGONrAJLQXX7TlWXNmeqDeYuFxbvTB3RhGEqBAw6l90MaAoQb4UT?=
 =?us-ascii?Q?2xck+vH0Yj/jftGrExyAeGsDCeAQCi2VUgmjKLBLzqKwDJUcpRFQe+knjcmh?=
 =?us-ascii?Q?B5oxclNysRYRW3cDv8zF6P/OSEIoWtT4/Pfc94GMK0q6O8pJVWbRiqxVVWSh?=
 =?us-ascii?Q?QbE4STbfdNBiOlfKK0lROLx+9/VBYFyNFPFcMmTSA/kzvn4l8yFoyoEG/rU6?=
 =?us-ascii?Q?6dAr+oyXJIb4IM8PMVlnG+T9zvFEV/aeRKAnCZd/mCgo8J7Q+wRk84iiQOGD?=
 =?us-ascii?Q?WbgPgOVuI10DwBUav7BLFGco/zMWeE8OnO4ObMlrAjXetLOrjxPPJwZ37tgj?=
 =?us-ascii?Q?qC4+K1gbJJvZbu7cWgaSlmRVYUL1m9ED5vdbHFLef3ujksFKkhFsVEvGNilY?=
 =?us-ascii?Q?f9e1Cl2mTcReCFWpLpbdFJxhggs0NekuZVXVqnAP7k7yQa/2JNfu4zW9o/Qs?=
 =?us-ascii?Q?5z0QYPRPJpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kHN4aA4XTxdjCmp39osKUn7dp1tXgyxZtItGWnTMASl3HV4IyTcUYK83IFeL?=
 =?us-ascii?Q?JWWp65lg/0K2JZ5OzKl3dV2TvogEhnsYr7TzVHBsWBqdB8GviCzreq9KrP89?=
 =?us-ascii?Q?S/ugsputgKSLUmH8X1pdQDN5hZ/qY3DuoEcLQ61AM0arlt0t2DuMCpqpEqNX?=
 =?us-ascii?Q?pvCOXj1DFED8eI9moHSv+iCCR3dJbMDvdCv9NuZJza1E3dpIUOXjjNuGBtmC?=
 =?us-ascii?Q?I5/9IkVLnE6x5GF5Z0cDg8rPJlDQqcRpP77qTU0dgHopEq3HLQklOVHYfSLb?=
 =?us-ascii?Q?2bNCA2Lu5q1NIN6neRVw9BG1mnyFf6D5hotYZMMSNwm5K72O7OC995AEG0G3?=
 =?us-ascii?Q?Ddf3dC3Ksh0c8PIGuh9LUH3Ib1zeG5a1i1PtEdIbAHOqlEL4WdPvH1siWQHa?=
 =?us-ascii?Q?ro85krN4JU4G1lzTk4TdIMjfYMTstQw9wWELFzJPSPIzpVlKkcAgcp61x8zw?=
 =?us-ascii?Q?iax6AuPqn0mbGhCAQMttW7E8UPphuB0j0liK1WOHmSirlpaj29FIJ+8pxD+q?=
 =?us-ascii?Q?H/C0EprA43hHgIK8dIHi2jjhhyf8z3fqKujawfXwMZzyJZbFo2Gci1Vq/fxD?=
 =?us-ascii?Q?HuBMlV8JQkmEYNO6aqprln3ssDw/V9avVLH2sTBhDy0+p3k7Ml5lEw4/aArc?=
 =?us-ascii?Q?jTPGtx4VhRdUpUeyPnOHu9nSv97S0peuv7dlOs/Re1lc+F2ILkapgcUi9SEQ?=
 =?us-ascii?Q?e/SplAKgizQ66FKuUbNRh8OOYIglEEaGWaVWsDUtInDlFDSnPZr1rKNZGT6A?=
 =?us-ascii?Q?Eqkc/ngwtt4zPDIq/r78nZEXVWOps6DBRqgIDqxQlQGuURRpxCDVkdgS5urV?=
 =?us-ascii?Q?nUiKncoIxhHeOiDmFkPKk+iGUERNMB59OzuEBUtr+70pWFKrMpGmZ8uPeBKF?=
 =?us-ascii?Q?rpJzikYHvRc+/pwXop0TWcLMeKwrNzI7n/W8y3aucIN6kZ9elXBJW6/4Ng80?=
 =?us-ascii?Q?ENEXl5LGOor8yONr3ICuT3BlfhGGrrgmKQVWrtA+hKulInIk0gUW0dCnt6+Y?=
 =?us-ascii?Q?+ysEKx4FiKlgsjV0fhF9EuG5WyWpYlF1hO9Kn17QhEq6u3RBhSTK+09IaHVv?=
 =?us-ascii?Q?H+ChVVzUiSKAS6sGL7NcBlru6YvaPGf+OZ3b+rcZ73f2Oni2M/5SHB9aaLyC?=
 =?us-ascii?Q?Au/n68wTsvkm3okh5ezuwoWepbQndpjhUhoiJRwG/SfdRF8ta6rL0WYrxBrL?=
 =?us-ascii?Q?3+2/LTRiXm4WkmP9mXsUG/+245JMoeHBVxNCv30MYONFjBbjXYdqsrKo1L9i?=
 =?us-ascii?Q?C6LUvwBgXgsVAiO+ZfpMVyO8iluIAd6I8qRH2mqHnOXwoRpYTLsbRRE/xDWc?=
 =?us-ascii?Q?Qu2QSAgGUoj0LQ9SbK7kAIdhG+BdnJaJioLdGPSz/Q/wYXAYOcbAR8F7f47M?=
 =?us-ascii?Q?M2eh2at2/e8BLZrTiyQU2eVkLicEWHP8V7zA8BjlpR4Q8QA6zBmMzY691Igh?=
 =?us-ascii?Q?JH4qcz7wA/BufJM9QwsZgLiuVOW8I1jrkbuCYoEQbO1gyQQSemQWGSEuZFfS?=
 =?us-ascii?Q?S25WLWmCcdLVD36iyygM5jQcJ2sqKKY1O2FSQPjKXuXKt9Tk+VNp3zjCJoV/?=
 =?us-ascii?Q?k06Bwk9HYtpAxCmX/Rwu8pApfolTH1dj93WPl7XOHmWUgDll9Mo9aIqUEkBK?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: m97CTUixnEu3F1g5waik5MLTZqGg152N/P0Af1F9/1hk0VEKBrRgfeoh/3VJrnmPtgczxixoVPRhZeRWAc8EnoQBy8yWgTyEs2iJgZ2QPwonEd0/DN+Lheij6TGb5pjK2EzsP1cSGi/fzWuUendvqPK8bOwY9x+IjiaceF12OSchpdax9SaoFkAbnSXFKDDbBD6rW5Q+G31NXw+EktSlCxKjAk80TmtwTjLIXteyJzSiSLPOqlasgLBq6c+8P7/KXYjmuWOuLf45+7tkLrfl6IbnHqaRD9lr1/YqoR7PJHTM1IB/UUk6Udja1XaI0TqloPvCkPb0trTxxXx44mPFNJmn8G10usfsVFCCWH2dSyamtdhk8Vm2c699jInPVdFnf/CgmX86FHmzqS30LUmZfFt4hXKNkXN64Q15lUMEf9PotSeCnwz1kJvbyvithMhcFm2jdH0bVTmfz45gi8KsaJDafdV3JvKQazPySbYUoq714CzxvSDc+KewYOVK1kPtcGP7D1CYcGb1sK0Q51bMmga+92g146kdykOCfPWcoXRC+KzctAMvLyIzEGkDy9PLs5h12Vgj9JKrsd6PuvBxMT1w5V1IExkv1rCfdjd2egoCD4FgWNds4ddSa6AgyOEQ
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2325d7fa-defe-4e78-e57c-08ddf478105a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 16:51:06.6873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImEvEz0goQNk2QoxcaI27f5LMpANeuk+fIHfx+c2dElxnWUGF1e2y91ZcxYwwEnxSqkZsnZcmaglnG7UKteXbpYrbCMh1IDe5yzaplziqBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR17MB6089
X-Proofpoint-ORIG-GUID: kvCIUpmb_Q3vdUNKA9Q0MzVE3soRCZ5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDExMCBTYWx0ZWRfX2Fm+cDIXNGwj
 EyfKTPkLGtjFaPLg1SB3EYue8cF2ToSqAOWk/41nhU6qiCzdkAzVx6ukGJuvHxz9FaDeN34nddZ
 6CPPJFmKqUJtJ9zyq2C98eclW6dJ6zID5zFekubLY/UedkWWTqEM1EhNXF2lOE3d0Mz1dEscROH
 1CxuVrhyelQUO42wiq2GsvZrw8cYZ5sq/+37mX1MyWc7dZwljHrpHLAlw9eOfKA0+2GJ/kCFv0g
 98FKzhv4YKeTkUMXFD4bBsz1rMxvwdTYGwXRBUXJyMbyCYUMQo2Tni1nKlJOEjV/hcUAq54mtUl
 iIc5/uklD55qJEC/VF5jJtuBMx2vQyjuuPR/zU439OJzTYUjQgkXx4eMR8REzmsE3k8SpTkmf32
 YE6Q8WFQ
X-Proofpoint-GUID: kvCIUpmb_Q3vdUNKA9Q0MzVE3soRCZ5l
X-Authority-Analysis: v=2.4 cv=e/gGSbp/ c=1 sm=1 tr=0 ts=68c843ff cx=c_pps
 a=LKjW2ISLMUJKWi9uHAe9VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10 a=F6MVbVVLAAAA:8
 a=_28Ee_KPWOKEt6bo-YsA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130110
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for DisplayPort to the bridge, which entails the following:
- Get and use an interrupt for HPD;
- Properly clear all status bits in the interrupt handler;

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
V1 -> V2: Cleaned up coding style and addressed review comments
V2 -> V3:
- Removed unused HPD IRQs
- Added mutex around HPD enable/disable and IRQ handler.
- Cleaned up error handling and variable declarations
- Only enable IRQs if the i2c client has an IRQ
- Moved IRQ_EN to ti_sn65dsi86_resume()
- Created ti_sn65dsi86_read_u8() helper function
V3 -> V4:
- Formatting
- Allow device tree to set interrupt type.
- Use hpd_mutex over less code.
V4 -> V5:
- Formatting.
- Symmetric mutex use in hpd enable/disable functions.
- Only set and clear specific bits for IRQ enable and disable.
- Better error handling in interrupt.
V5 -> V6:
- Formatting.
- Convert pr_ to dev_ for printing.
- Add error check to regmap_clear_bits() call.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 112 ++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ae0d08e5e960..3d161148801a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -106,10 +106,21 @@
 #define SN_PWM_EN_INV_REG			0xA5
 #define  SN_PWM_INV_MASK			BIT(0)
 #define  SN_PWM_EN_MASK				BIT(1)
+
+#define SN_IRQ_EN_REG				0xE0
+#define  IRQ_EN					BIT(0)
+
+#define SN_IRQ_EVENTS_EN_REG			0xE6
+#define  HPD_INSERTION_EN			BIT(1)
+#define  HPD_REMOVAL_EN				BIT(2)
+
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
 #define  AUX_IRQ_STATUS_NAT_I2C_FAIL		BIT(6)
+#define SN_IRQ_STATUS_REG			0xF5
+#define  HPD_REMOVAL_STATUS			BIT(2)
+#define  HPD_INSERTION_STATUS			BIT(1)
 
 #define MIN_DSI_CLK_FREQ_MHZ	40
 
@@ -152,7 +163,9 @@
  * @ln_assign:    Value to program to the LN_ASSIGN register.
  * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
  * @comms_enabled: If true then communication over the aux channel is enabled.
+ * @hpd_enabled:   If true then HPD events are enabled.
  * @comms_mutex:   Protects modification of comms_enabled.
+ * @hpd_mutex:     Protects modification of hpd_enabled.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -190,7 +203,9 @@ struct ti_sn65dsi86 {
 	u8				ln_assign;
 	u8				ln_polrs;
 	bool				comms_enabled;
+	bool				hpd_enabled;
 	struct mutex			comms_mutex;
+	struct mutex			hpd_mutex;
 
 #if defined(CONFIG_OF_GPIO)
 	struct gpio_chip		gchip;
@@ -221,6 +236,23 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.max_register = 0xFF,
 };
 
+static int ti_sn65dsi86_read_u8(struct ti_sn65dsi86 *pdata, unsigned int reg,
+				u8 *val)
+{
+	int ret;
+	unsigned int reg_val;
+
+	ret = regmap_read(pdata->regmap, reg, &reg_val);
+	if (ret) {
+		dev_err(pdata->dev, "fail to read raw reg %#x: %d\n",
+			reg, ret);
+		return ret;
+	}
+	*val = (u8)reg_val;
+
+	return 0;
+}
+
 static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
 						unsigned int reg, u16 *val)
 {
@@ -379,6 +411,7 @@ static void ti_sn65dsi86_disable_comms(struct ti_sn65dsi86 *pdata)
 static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
 	int ret;
 
 	ret = regulator_bulk_enable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
@@ -413,6 +446,13 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	if (pdata->refclk)
 		ti_sn65dsi86_enable_comms(pdata, NULL);
 
+	if (client->irq) {
+		ret = regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN,
+					 IRQ_EN);
+		if (ret)
+			dev_err(pdata->dev, "Failed to enable IRQ events: %d\n", ret);
+	}
+
 	return ret;
 }
 
@@ -1211,6 +1251,8 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
 static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+	int ret;
 
 	/*
 	 * Device needs to be powered on before reading the HPD state
@@ -1219,11 +1261,35 @@ static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 	 */
 
 	pm_runtime_get_sync(pdata->dev);
+
+	mutex_lock(&pdata->hpd_mutex);
+	pdata->hpd_enabled = true;
+	mutex_unlock(&pdata->hpd_mutex);
+
+	if (client->irq) {
+		ret = regmap_set_bits(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
+				      HPD_REMOVAL_EN | HPD_INSERTION_EN);
+		if (ret)
+			dev_err(pdata->dev, "Failed to enable HPD events: %d\n", ret);
+	}
 }
 
 static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+	int ret;
+
+	if (client->irq) {
+		ret = regmap_clear_bits(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
+					HPD_REMOVAL_EN | HPD_INSERTION_EN);
+		if (ret)
+			dev_err(pdata->dev, "Failed to disable HPD events: %d\n", ret);
+	}
+
+	mutex_lock(&pdata->hpd_mutex);
+	pdata->hpd_enabled = false;
+	mutex_unlock(&pdata->hpd_mutex);
 
 	pm_runtime_put_autosuspend(pdata->dev);
 }
@@ -1309,6 +1375,41 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 	return 0;
 }
 
+static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
+{
+	struct ti_sn65dsi86 *pdata = private;
+	struct drm_device *dev = pdata->bridge.dev;
+	u8 status;
+	int ret;
+	bool hpd_event;
+
+	ret = ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
+	if (ret) {
+		dev_err(pdata->dev, "Failed to read IRQ status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
+
+	dev_dbg(pdata->dev, "(SN_IRQ_STATUS_REG = %#x)\n", status);
+	ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+	if (ret) {
+		dev_err(pdata->dev, "Failed to clear IRQ status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	if (!status)
+		return IRQ_NONE;
+
+	/* Only send the HPD event if we are bound with a device. */
+	mutex_lock(&pdata->hpd_mutex);
+	if (pdata->hpd_enabled && hpd_event)
+		drm_kms_helper_hotplug_event(dev);
+	mutex_unlock(&pdata->hpd_mutex);
+
+	return IRQ_HANDLED;
+}
+
 static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -1931,6 +2032,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, pdata);
 	pdata->dev = dev;
 
+	mutex_init(&pdata->hpd_mutex);
 	mutex_init(&pdata->comms_mutex);
 
 	pdata->regmap = devm_regmap_init_i2c(client,
@@ -1971,6 +2073,16 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
 		return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device id\n");
 
+	if (client->irq) {
+		ret = devm_request_threaded_irq(pdata->dev, client->irq, NULL,
+						ti_sn_bridge_interrupt,
+						IRQF_ONESHOT,
+						dev_name(pdata->dev), pdata);
+
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request interrupt\n");
+	}
+
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
 	 * motiviation here is to solve the chicken-and-egg problem of probe
