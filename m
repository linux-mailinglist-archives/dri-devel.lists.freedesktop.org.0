Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C334B69F9A7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2F910E074;
	Wed, 22 Feb 2023 17:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B2B10E442
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 12:16:58 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31M8x7oQ004003; Wed, 22 Feb 2023 12:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=9po34kKpeVMtERAXMZKVnKoD0RDdKaUj15lCSpVNXus=;
 b=tX7MrKlwhUqDB1jC2YH+fb8PNs6z1uUP75su4LHmLBYgv2YUVLqmWm9QIzz/K8eefvov
 y++wxvd3Usjtm4ajXz14RmKZzpbE3IzwBkqryUyka+Rs39PhlMQ0cEsvy9ZsDCQ+JCCu
 rsG9/bI3A280TI1iHhk+3JfK28WM87CESlW8NopgA4KuFHHFUzuMK7NKrAMl32s9683V
 h4ZqOMPgsKvllOhNBds1bBsfqqSuuedfOZ9Gwluf5VGntvlP5zNfuXn2JwQwiqVmHepx
 eCbd7bPuDfB1HVU9bbT/DJCjPtAz7d6WziyZYhAXdT/xvrJdNPVds9b5LjF6SN+6YcAb mg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntp9tqr19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:16:51 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31MALiw4031211; Wed, 22 Feb 2023 12:16:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn46fmee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhJDe0mKvubYTuq1LUTRnImsKAoXDdmdW7qWNLGPTBI6PGpjZQPRAY1ETHx0Qe7ZZP4gVBvHfTwQIyOgEl/ID3HN6FXTdbX6dnWRCVIDNbgaFrHsDk7jqL5qNdHFI1tEonNOcFsEYbkC/Gx+TKprRtGTQeAEwmO5hG3ViakXe4yt4FKnz+DHCU22bAHFIGK5GfgTuWSvdWJGmT4AE5rlmaTo1lRwj4S3fabUuFJRFKoj27mZ3XRSn5DtXmbv8yvk7kqNHlvv9lA/sNnnfG2rgkQP2Js/C9U7Ep2YkFyVRCby46quXdmKm51cA4JWfq3Opfy6B6LaQv6nZq0G1ZF+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9po34kKpeVMtERAXMZKVnKoD0RDdKaUj15lCSpVNXus=;
 b=VtFgsdB0DMfT1ElZSTLfvoqFP2mxDJ+r4AtVyDZvPYJaATXjG5hprRPJ280kPOj3TDG4uXw/MUfZj2HIjO335pCPcYoLwFOD2hGoKZiuaglvCBeJTkg7PXac69eOWqtCsR9BYdkrvEKWZ8H91sYx16BGhqem4SFGVFqGZdhFjkqCfGlzZEj3DVoiHWXATtHExXDgkFkMBu0HSxZzebN4C1ZyxNxr3eiuX3xxs/WTdalpnVcGH5C+ce4i2SORjJZ6mXlEnrlHF8Mizv/rgrSo9+fP/Lw75rd2NCwzDrNKiDh73WxDApBPjS1w/ZJlVjeg8+6tfrVN85fYtyMDuEruzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9po34kKpeVMtERAXMZKVnKoD0RDdKaUj15lCSpVNXus=;
 b=UVdd96cKg5M+FipaeMb3JhrMBqt+9t0YIJsknjqNoZ52qcOX9E612Q5ht8nSYG2rgGz1cn6gjG7YxtBewYo808QWTueO55umDZ9uYxBO+NiVaksDF0a+6PaNmZBvzMG++CPCO3RfTyhTrnqCxQlWeIxLddHcjdME6Of2rECGcO0=
Received: from DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20)
 by IA1PR10MB6805.namprd10.prod.outlook.com (2603:10b6:208:42b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Wed, 22 Feb
 2023 12:16:48 +0000
Received: from DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760]) by DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760%3]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:16:48 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: mcgrof@kernel.org
Subject: [PATCH 23/27] kbuild, drm/dsi: remove MODULE_LICENSE in non-modules
Date: Wed, 22 Feb 2023 12:14:49 +0000
Message-Id: <20230222121453.91915-24-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.39.1.268.g9de2f9a303
In-Reply-To: <20230222121453.91915-1-nick.alcock@oracle.com>
References: <20230222121453.91915-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::19) To DS0PR10MB6798.namprd10.prod.outlook.com
 (2603:10b6:8:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6798:EE_|IA1PR10MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 8095c324-ea94-4bf6-611b-08db14ceabcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l15GKZoS9ns9cFCCxLYKkJqoVz9CZD2zAkXou9Il2naH0pZINKc1QdtgAFEceSCueHFYlX2iBRCjNdn/nisGd3RL1JPaJjmUNWby88L8XwaTcjNuWWlpDSzKlUb78WorGibUrc3vdu3H6BgehhrGj2BILjgiUNJ+QimyMOtQl7VHrY3SdUA+Z2hS0Hgt7gbj/q9DnyIK9oQyiHaksiFj8Zh9TiH66fdoRWPNEjSuSbg8y0K0DiyMeIfs41PEQreegttukDAhgntUxN278szLKBN5WnEtcZqV3W7zKUULl6CIOdcB44oO+IbKRBQ+cXFCsFi/uGqr4/QeX5w3T+OPSNuTi5zSEaQ1a8lJGYmGOSyZt8qtpHSN+8BepB7CdDV3tjFAyUiLq89L8vqzBiAKekmht3oPcKWywqNmCpFOfIR+mp63UMjao9m7dxa1KekjoTK735R+qODvQpU5MBY+L95pjpD/WlIMTlnX4tIyKF0AEEnvnXSLurABMV8ZypAlGL+3vs6YlJo9baz2gFGGfLODiy9Gk9/AQdGLZFc51FKkI7t9PtlizVeOEvSQiBIBWnPcsbrYDR3ovzA3qaM/3LykUp+VUqTwxqpJujU9y9WrjG+JhKIt6K5C51FTx4v1O72ZW4E3NZPcqfOmFiSMSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6798.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(7416002)(36756003)(5660300002)(44832011)(83380400001)(2616005)(6512007)(478600001)(6486002)(6506007)(186003)(6916009)(66476007)(8936002)(66556008)(4326008)(66946007)(86362001)(41300700001)(8676002)(54906003)(1076003)(38100700002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mcf1oSGG+9xca3GbsHw7vhAtvrldfs621vCVYomPzvtTdMqpk0gL8P/ItqZ2?=
 =?us-ascii?Q?fD/htVEeGrrLb2sM+EK/TVIK/i7zeynxvcEpO6c3aFTM7y+AKyuG1zHP0K6p?=
 =?us-ascii?Q?SoVsFXhp+sS9tpXqVA9EDpPbWQQqUN1IRuPLnYuW21mlhlw1FVCrdBiHE+LP?=
 =?us-ascii?Q?fv4pYUXbm/29l1ChuBhAXPQ+0LZxLjgRgiwlUwI1CsOC5E1myVVYIiKnv1Wp?=
 =?us-ascii?Q?FPeyDMaPSxRP0C7yeKtvN05EL7kDBhjIpEjK94FVa4p+CJdgPPTjVuSbvUrP?=
 =?us-ascii?Q?VqB7Je2ilooM7kGjagzuO6zGiSKswUxco6DLk5TXHrFd1fUN2KsLawgYSrZ2?=
 =?us-ascii?Q?zqgF3hNohMMdtjKJKEDK4fcuyBZAVT+R2XBju9QxNZp8Nb8ydzy84Y/axBhH?=
 =?us-ascii?Q?TVQMRD0ckE7KG5aUvfDJHRxrrynRkSxMaCUu30f57K/WkwMq033ZMaEHIxx0?=
 =?us-ascii?Q?b9n1jPMwp4y+xhRtyw2UqNoTVoNYuBUqilNcfIchPYtlWzv+AbKqy4wigggs?=
 =?us-ascii?Q?NYlBFiCwdZyb+XXAx3iFp6wIUv/J8bpprZY+v+/OiRD8YmyzAq4fCLVhFY0m?=
 =?us-ascii?Q?GzGx7fGtGJdAx4sIqkWKlECOahvXG9zPt6nUAcBIVlpRU7yXeiRUq6PE90GZ?=
 =?us-ascii?Q?FtJOW2FXO1Ii3KFyBaEoBARm5p0DehuXd12Ynh7ys9fJX45xqJ2rfkHz9O6f?=
 =?us-ascii?Q?pr1P0j6EbGCQCSAH0MLyODTdIlW38rOlvX5uhtFeKa/TBthMt32h0UKtUk2s?=
 =?us-ascii?Q?fe83bnjaoTL0GbUnq0Qe7Y7ubz8zSybppq1M6K4igz2J0GqiqrPjod9JxtRT?=
 =?us-ascii?Q?OqzBkbjdMqebwiREkwbD8igLXjczvgfx9IiU5zW2LG9eCPj1dIQHaGYm1rJn?=
 =?us-ascii?Q?PXMa3qWDGKj21UkufKw3apAqCANglSam+Ec27EBjMx7eUCKEJE0dx6icryPf?=
 =?us-ascii?Q?iMfLQy9tUwQMePwRBOWgSYKQFrPfwfpLPXK4aaWNYwBPWT2ot4JdyxW+cUT2?=
 =?us-ascii?Q?9DQbLVRZwBcniyKdg3u3UdrYPKouGyLcKBD7vnLHzp+kkKGeuV/WP4tMkmDt?=
 =?us-ascii?Q?/fqI2uYh472fP55ryFtljaBLdukOdNSUxw0ebpzWxALmbd134jHUQqjDZMlW?=
 =?us-ascii?Q?A0Ykkp9qst9WFu+rymOysLeMmNpmFuXMAl2lT5vehIjxkox6upeO+HI/KGwd?=
 =?us-ascii?Q?tTxiTBLUbrsssJmue01EQ3g/In20DGttoRNJJH8oPomDku5tbheq1YsFiaYI?=
 =?us-ascii?Q?my3DpWCMJgjVPGgaI62e6mvFFmrHpFwwk+oqNe1BfsKupw4LuIC7iHtPO5ks?=
 =?us-ascii?Q?0RO0iAD18PUdl9NuVGrNcdAhzSyaTDHxuWYkzMRVwU3a00f/1vGExxd/mtbw?=
 =?us-ascii?Q?PozghUsxo01MhAhYQmTVrkWoxu3BekZtMW8boz0UkXwZRA8XP0tQaEi/oBQB?=
 =?us-ascii?Q?My7yyfkz2nR0iTh5HcS6+WAVyeVmC4kDc6f4BFj+TAUNhVisQHZD6ALQuxCg?=
 =?us-ascii?Q?elRSYa11udJWy2rUq7yleI0ffkZbSXZDmKelMcNbXXkkmNVS/6gc+QTu2ir8?=
 =?us-ascii?Q?k8d4PbQ266ou9tDTp5OWLnAtvz3R5TWLc9CRwRBkmRNW6mYgVHIBq9Z3Xr9h?=
 =?us-ascii?Q?RZGLYiycDro7LtZ6CkU4aoE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?v1UMuDP+GWMiaCn/E9LdLy0tgI0DAo7CmOeFU/8rLnD4dVSFd0JpCNkQvutX?=
 =?us-ascii?Q?M2F3pH1TKFaFICQcw15xeC7/uAlQ59PFTyoByUxZANPD4t3G2Q/liWx1RgbO?=
 =?us-ascii?Q?SEBW5XOUhwd9g9CWipBVBHcLxRfWbprR3hoePsGP1bqE37Uzj8VggbwXsG8p?=
 =?us-ascii?Q?Wqihd3MjXYTbtNb6TUNIS58zFJq1yK5bn1Ywcyvs8MBsMrqJpeKoC1C6Qnjx?=
 =?us-ascii?Q?/RERFsCwsoCcHBgQkXrAwq1MhHaGIII8wyIL6Ad7504JWSKS+CANJ0csioVD?=
 =?us-ascii?Q?XymSsBK7jbgNEo6/qnbfoM1JibUaHAZWJhG0f+I9Qos0x3Jr7nV7/eMKdmHS?=
 =?us-ascii?Q?5GLphRr4pwKikksoCfdeNcO6sjh/rYq13MUkSAA8rry5yBN5cO/y/QRnR7v9?=
 =?us-ascii?Q?kq4jOfKKlA1EHpDXaqE4bqzxRAKLHh11hCIT4BwUeGe5GkjDKrjG9AvSGr4T?=
 =?us-ascii?Q?+BMl8ntSCZ3yxKLYp8ZjlsL6zRpwU7LSpbSzqvGyNA9ayxWy+xKrMSSK9M3Q?=
 =?us-ascii?Q?BeiXrrVKgiUHZXjVmyM2TzU9HET7AOfbibgSA2VvqR1UKwGm1tp13oFmsQQ+?=
 =?us-ascii?Q?bcuQbWd1TvDhPJkhE2EKySdzxaviEmyBKZxtlTJXVhjkcAQ+errWZ0lZKQH1?=
 =?us-ascii?Q?1UPkP6Pw3+PY7uJOzHVGNTkpAkxWqBl0Xts4Tv6lSYPeTasG0XaTNbBeG+ZY?=
 =?us-ascii?Q?mFKy2Qnb2y0cGMC95jhilbuFut7yUOA994+pKuH61Cd5flqCzL/icpAgk0cr?=
 =?us-ascii?Q?F3HEgrcNLoHI91Foil0CQuYIRCk6MFx/7IvEvF8OWBMfkaungRCk60a5wvK7?=
 =?us-ascii?Q?R9G7iBqkwglOZslZCcKcdYqlllb9/EKDR8eav1liepz1UzzGDgIkCYQ+yAx4?=
 =?us-ascii?Q?M2dECka3UfWB2UdsF9+AknflKXFfGaVyaLyNWVVW6DjGwCd2ShoJ0XRdpfjI?=
 =?us-ascii?Q?OuEgbIXnOtpd6kQGvi7d6i5TrNjbYq9MDREpNUJeufeeiDGxwxAWCEsWKt9v?=
 =?us-ascii?Q?EM+X?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8095c324-ea94-4bf6-611b-08db14ceabcc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6798.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 12:16:48.2266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTliqprYugeXjnaTh7HMREQw/rG2zXzdfG3qB7aj8EqQGZ7C6i/z87btbHr7UrkYWr7yhc6KTHFGglDCyNXbvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302220108
X-Proofpoint-GUID: 2Z3xJNIxm659H2bSaR2mzwloFhanCcJ2
X-Proofpoint-ORIG-GUID: 2Z3xJNIxm659H2bSaR2mzwloFhanCcJ2
X-Mailman-Approved-At: Wed, 22 Feb 2023 17:09:36 +0000
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 8b41fc4454e ("kbuild: create modules.builtin without
Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
are used to identify modules. As a consequence, uses of the macro
in non-modules will cause modprobe to misidentify their containing
object file as a module when it is not (false positives), and modprobe
might succeed rather than failing with a suitable error message.

So remove it in the files in this commit, none of which can be built as
modules.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_mipi_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 497ef4b6a90a..4101d9780059 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1294,4 +1294,3 @@ postcore_initcall(mipi_dsi_bus_init);
 
 MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
 MODULE_DESCRIPTION("MIPI DSI Bus");
-MODULE_LICENSE("GPL and additional rights");
-- 
2.39.1.268.g9de2f9a303

