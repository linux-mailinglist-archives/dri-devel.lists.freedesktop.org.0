Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BAAA17DF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 19:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6D010E158;
	Tue, 29 Apr 2025 17:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="NrVXxajf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010004.outbound.protection.outlook.com
 [52.103.68.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061DE10E158
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 17:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BL1L9plWfslWI5QHOLUKFMx/BmTtjwemQrmsGfyJa1kGSnKbCfAkrdAnr3KIkgwdj5wAdCTZYj3+4HTpGiGioXZE12VY8TxworL2M124v7WSmoyRgCnEJcqx1HPcZk4t6yMz5CvW6laBfjZkJsdKEEJDQL/QGMWfda+HAqNw174kPkVTSH7x8Xgp2El5nOCnjQN5EDuBUtXAYzOcl6kEaeROrumY4pIHWjvboNsW3lCVuSqc80B9lVeKOMvjK0KK4tqsS4CpgNaZHMAl5JMYNlhNCQBSstpJtr44OkqZ1JMTtd1Nftzc9OeZCD/+f2yROGBwK/NVoS8h9yT8I+zPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJQaxb/BgRCUSFPNKgQuHsdvyt5HoJ6xRlv7pEcW7FA=;
 b=hgrSGEqVYnUMF3C59Z0BHQj5F5sb7qA+mztm824mtEZLCQmq/n3pZdTe65RYV58NpdkNl8n/Xz7z9AWllfw2WUb5GSbaShIRE2BatMZbuOEcxngM0CAiPh6QdYI9zH7IB3vve8cYMQuKdyuBclGFEJr4HCHRBcb2tLLDLf+aYoiZJmCwuAeVZC+smp5DWNORhVfUO+wTIgRN29F+RsxD4XWUnT4nyOp3bWMMObdWD+N0OpoJSX7J2ySsoKNK5EVO4a06k++TaOmNF0YYrNHqe+XZ/cw7l8D+2eA9hMDUaX4PnkE7do9Ot8pVLymP8/oO8Bnrhwri5p201znr0XAXfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJQaxb/BgRCUSFPNKgQuHsdvyt5HoJ6xRlv7pEcW7FA=;
 b=NrVXxajfd9CLyNVomRIVfIOf0T9g9bOEcrwWoKJjhsPv27rMWOyy06Al0m2xtxXRFk5NA8oOyhzW1PbM+bmWcwJultzPML+MgBBTyn4ZpEvShg9ooU2jxc6NaVkm0PBwKN4KOFgV/aZPtKCeRv1I1FNdvzJK9tmJX3kRQje/wRPsgzlVUsBP1koWkybxAR85hL7LFAhGD+rrbddqOo9edlOmVC1ywGLttnM7MhWA2iDCNe62Ugkzk0Zl/cAjkn1NMD8Vd0IUKodDEIaWRVfEvarGR6vWo6L91JRgehcsYN233IpPVMo4vYeHYMCrZZtARpQ+aYsfRE8vnEkKGVD/+A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNZPR01MB4493.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 17:52:14 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 17:52:14 +0000
From: Aditya Garg <gargaditya08@live.com>
To: pmladek@suse.com
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org,
 alyssa@rosenzweig.io, andriy.shevchenko@linux.intel.com, apw@canonical.com,
 asahi@lists.linux.dev, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 dwaipayanray1@gmail.com, gargaditya08@live.com, geert@linux-m68k.org,
 joe@perches.com, kees@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
 lukas.bulwahn@gmail.com, marcan@marcan.st, mripard@kernel.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, simona@ffwll.ch,
 sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
Subject: [PATCH v2] checkpatch: remove %p4cn and add check for %p4chR
Date: Tue, 29 Apr 2025 17:50:30 +0000
Message-ID: <PN3PR01MB95970CA0E1E1972B39405B43B8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
References: <20250428123132.578771-1-pmladek@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:264::9) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <20250429175029.56866-2-gargaditya08@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNZPR01MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 0115287e-a2d9-478b-03f6-08dd87469304
X-MS-Exchange-SLBlob-MailProps: dx7TrgQSB6dEoOZOj4tPAZubvlSTC8VXA8MmqaPG/8fFjClICWiBGQfiN69UVvCHgYHPlnls6u6/RvvHhUq3rdZ+MYLx+wRnQbqdIIkS8O42CVxnalYcjjdoIXzE4lnzhETG0in5VEPEnF0go6DVC0Fy0r7wl+CI0d4yO4AArwwe0XSDf3jSx6cYyzj7UC06eox36tVeidzS8yjvH32an9KgReeZJsUKxbjUOHPdHPWApq6Y88rCwNbbcBvGHxG6cZSoCTj9onhaplSUP5hNgoGMD03wSq4PkVuMG8+leENwUEW2YfX4oJgzpAfcTDCM5LgZUTKb/VUZcQWlUplCtDOqXv+E5SnTzYZpDy/joiMvd73PzCEivobdo7d2xdmG6I8gQdVhSRzEaN2mkludulnErlCE101t671akLS9FemXzNnWpfk409VKNXN0w9FFMbFKd45GZYePczw2oquZ3/+RI+Bow+YY3Gd7iqdRH3w3h6G5sEt7DO5i1TZnnxZN0WRLsUvgDQeIYMTsUi4AqqfPlBm3gOJJ7wc9xBtTw0I2QS+8w4cu14GCcDm3Qe2mAu2IMYPf3Xc6oYtvkS9vFHdloggrWTjX88JVWkOZ2K5IQ0NW5BLy6M+oQ3Eho6y3g8PvX9Ylp7ecEk8d0V+RU1JPhZmU8Cm9mygpoJnxuLOcm0wXAc4uD/m1Hkbi4Mg0odNOdYabNQCgmCSA7hLP9Fp2KFY8nN7XSReAPPsDE1w2S9zyqJgj07SHn/1cD5pxNPH4eSbDNlM=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|7092599003|8060799006|15080799006|19110799003|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NPBlBEyQsZ81BMQOmpW/j7JnshTMKabywN2wCFG1GrAIGFpjLXbO/vcMSAIr?=
 =?us-ascii?Q?mC9m2ogTkBaRJRDfj2o6hF5C9bvfnd+uBrn/y7RUH+VI6QH/4OFl3eF1lqqr?=
 =?us-ascii?Q?u3avdkUyvY46I13aD14vLHVg/LltNlD6g7bWYextZpO03nTeFW+cY1Bc5ab0?=
 =?us-ascii?Q?rDI9E75geuHpFJeEe3oro/HdND2ebm16oKjVsf+tu26cz7MNjfvxFlExWeqH?=
 =?us-ascii?Q?k5XjdIpd7bsI3V1oLBgrN3FeZqLZswi0n3QFZgqG9JXckGt73AmOMD30ZxyD?=
 =?us-ascii?Q?1E0r2mEFbIYdtEPYU1ag+ZSZdg42GH6kyDqzN/4Qz6qThHMrgyVJLk+Vo672?=
 =?us-ascii?Q?IWc5BGOhw/i5aT50LheVQj++2DubDUafgilzxwrERzqW7xeH4+nYtka7VxpW?=
 =?us-ascii?Q?7fm65JUAwmQuAhK/SmsuMrmyw78awjOH38ciFRzjwxx9lBnONrxpYZkZ40Cn?=
 =?us-ascii?Q?mQpNDaKktOVskwvD2/LV7E92WKDMib6ugNPmYc342EPUXMOOcCwitQ2FUM2u?=
 =?us-ascii?Q?gSGapcxajqjwVZYndxmsvZknq/7/JNA7TnwXUO2buwh8plN7E9rp5Pvq5wid?=
 =?us-ascii?Q?NxqLyVdbVwwSoTHnsJEqIuY7gCcHAL2omBrpAV/jDAtGfSXrixnXqLh8L5IB?=
 =?us-ascii?Q?CNxkAnlANLYUVXB/fIHIysDHvzHOq2/Ng7rUiSrgWB5251pyJruRVxWAGFti?=
 =?us-ascii?Q?x3BDa8NQdL0LO1t3Lem9ija81083pCq5eggApSB2HeNxhLuP8izsoFH8gt9v?=
 =?us-ascii?Q?tyYo7Hyb9KfBVvgGjaAoJSjdK10BRNnJM/MjFDrX4WLFynEoaNUXjh2KItZr?=
 =?us-ascii?Q?8nq9nahKpwJlko+hgAHop3Qr3DYtoX00HRsaSbs+T0i9TmMEFEsQsTooKtpk?=
 =?us-ascii?Q?jKIhk0tNU/lsVd4iGpYBrGaReGlHydDsZ21z67N0zuLY1gsfu5B24MM/hzNe?=
 =?us-ascii?Q?95+sGm/IadvRBTaEZ495mvHrb/lNEXBPK34XiSLubDD1+g9K0lIcixb+klg0?=
 =?us-ascii?Q?2rUhw0dH6Ahq0/QwGZLahDYX6I1UYYgnipXPkrFILVTGis8uXc5vQBLf7nGf?=
 =?us-ascii?Q?Pn2Zuvw2++zvlVQHxrTk2XGMPBNWookptz5tbLj2EPf2F/LOPyY1oULNZN8a?=
 =?us-ascii?Q?2/Abg1yD9al0++gfDKcIbbaWzvFdMaR5cQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HJklBSVzF89xbnU5jzQUVpVEZoxG38YdjN1XIQP6xUqwyiYEUwiTaJ7fylyx?=
 =?us-ascii?Q?cfROwZCp1PjFyxYasdEFq2STvaoKbeM13uN2xWVKlPFciA7yr0DCnFxbYQS2?=
 =?us-ascii?Q?IFb0KfcnOcmAOYnsYoqo9RJ6IBvTCc2L29EiNCShV9rxgwrH0TUTNkPz6pN1?=
 =?us-ascii?Q?aS+6j1dE7F3kkLdfikrzkE9dE9cyujFV0yMvi/akhcXh8zhY0LOCXUurfqcI?=
 =?us-ascii?Q?mK2dOGIqk0s+H/GLc+UDvjmZ1R4Iu5vitnqADv3FuXbZDGhdjiy1l1EYsStm?=
 =?us-ascii?Q?RwZGGStJlsQ15qMARjp0AzoQX+0HSVnCe6tIZi1QlAiNltilo/M1K5iCTo2B?=
 =?us-ascii?Q?dDm8Tkh+xMbquyCIZJ4Re4AOhn4LGz2jAa/2SSLiNUrfnbhD6AaF2Zuoa0bh?=
 =?us-ascii?Q?8hbqBUA9PNkBZGYDw2OwVqM8smViNh95VpNawIOEyslWd4cIcD8GSAcnIy2K?=
 =?us-ascii?Q?WfQdWgSdq0Smb9QzZwBlSDDBrZtUPmjYb5LgOwY1mQWigk3UMGPUo1w8aVjE?=
 =?us-ascii?Q?cY6xfPU9fSXpPbKkZL+2mkaJRnZ/3LIFdz06XSAADmpV3TYPKyTBazh0yia8?=
 =?us-ascii?Q?Y+idghdE9iuL1KiBEr141ef62pfTsoHUV7/fwR3+apEbPPHRkafqf9CJzEPH?=
 =?us-ascii?Q?6dn4Pi7eYRTL8Zg98fy9bAHVHKW+Unh2MUK2eAojL59feOuEFPP5G9O5QU5q?=
 =?us-ascii?Q?26P1NopGvrYVzIstqdCOh9gQ2qYO7m2YprHrXfLd/LGe7Cu+SVhOX62h2uBR?=
 =?us-ascii?Q?mkqtY0GTYn/2ZG432MHEJYTJDniUxUxBaZm9TyjJXWWkImcM5TaraVy94n3f?=
 =?us-ascii?Q?zt9rnQrZ2jwhEBfpW8D1XkwfGma5TYa/eFqf6QAiFom0a8en3Omf8X7A1/Er?=
 =?us-ascii?Q?Y3oLMLuO7vn8W6PeKJT4BrF+xgTV4u47c/VMie3DV9MmmJPA0oYvcfDtXHxT?=
 =?us-ascii?Q?qFUFS3CUo+d66qM+b1qaNJTOyjLB/ZqtH+kshg9ErcYYjocnZ4J8oaPXE00q?=
 =?us-ascii?Q?oIv/YzVK5G2o1wRXzHHsvjHXNPivv+sDGLxuWnio9g9yUYbQfacPlUVDHAlI?=
 =?us-ascii?Q?+bjBRQj1jYsLzjbclq6PmKjCwjBX+Sr7qChsIGMFnQQ1oAg/Hz1cfd48ffYB?=
 =?us-ascii?Q?ghC7HS+0jHuJmOJ5MM6yO6g0YEE1rblSoOugicUo95FqyUkiLoLeb6Z3EOMv?=
 =?us-ascii?Q?Afu/Spea1Pz1N2TnnrVe0m2kcMRe/CBlAUOSV6C8asmgsswAqeRhrprPTWg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0115287e-a2d9-478b-03f6-08dd87469304
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:52:14.2624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4493
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

%p4cn was recently removed and replaced by %p4chR in vsprintf. So,
remove the check for %p4cn from checkpatch.pl.

Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering")

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
v2: Add specific check for %p4chR as suggested by Joe Perches.

 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 44e233b6f..d5bde8322 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6891,7 +6891,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
+					     defined $qualifier && $qualifier !~ /^c(?:[hlbc]|hR)$/)) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.49.0

