Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37EAA113E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BA310E4FB;
	Tue, 29 Apr 2025 16:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="NsskKn7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010006.outbound.protection.outlook.com [52.103.67.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3257310E512
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:08:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Se0GMlPjNuPEBYciD62I7VvkTFhD1I5zuU6u3jS4Z0slOwLS7cbmQh1LdkJhoAD68PiyPkzLEy8rlOX8ZBwOZRQ3B6EDGkO+sWyqsjypfumzt8q+KIq2vnvlgBHVKWaiI05DjPZWQaxFr5NZn9zjQDCTKRQYmphaGV1vPqHR5sk66KVM+7qQJ5fbb/ycuDv7k6A+Co2xjV8BNAB/S8+gj4Nc5oCV5uuMwqkEsJHY5zQZaF46lv0cbNAcC8f8h2x5LqUu3OJlaNYX+QvUS9xdwUnoaoHsXilWV0vCqrFffTn6iesIbjvkH14SDf/U15km4A0vJGMarL/GkbQjDlzvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+zSMucAanQk2Z8v2NWQ09hnGQQjocCv966equeBwQg=;
 b=vH4vZiI0iSAHX9Syj4wcO3tIGvyNVf/3NUXH76HjXmxk1lhDD+HBBP0ndJZSWndeb8bVjlTiVIe+h2y0YRi9VVSYiNuxd0p0N4ycwrZpBUIqBm34+yu38KTDAzOimdeJNBYq6fSydctXT9vEG51shAcMYMKpI2pryX2U3eniaANqRflTJy+9Zy6sADb3+DFowXYLMcHTaD3u+2WehoH/6urdxAXX0oAaJpGAIyxS7XljCxhXfU5G3Jf+ioE2XwPVM12YA0EW70PnoLqhoSEr91XDwREnJ1B3LiDl2iTSmkIEQD+qlyI3O3velF2a66KDTq3WxSMued3UXk/7mogp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+zSMucAanQk2Z8v2NWQ09hnGQQjocCv966equeBwQg=;
 b=NsskKn7FbU8X56H+caZoLW783gO/TmkPV6N2923JTFLSIHwKmljZ6r8bcErAIPdNG9ifCAjlpWffYZ2JsPjGKBt4utwE3jKKyAK1CD6X29BGKvs6kMNctFhG3BZfWx3nUMzcgBQq/FHa9sBbnrU6vLHSw6FrL5fdpTGyzXgcgvPZQx2UcCR/tZ7cyk+dCjc32gS3C2o+H8yFdmHvVBQR4IUkdr5lR9mKaGCCdQhMC5McUqHHO7L7caA3n5oT9tuS74SkPL6PvXlVxDmwO+IybJin2SRCgv5YU9AxBvndp8G5+UjdJE72pqdY4Oo2aUzamaSCILDGm50Tb160Clc6Gg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB9769.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ee::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 16:08:00 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 16:07:59 +0000
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
Subject: [PATCH] checkpatch: remove %p4cn
Date: Tue, 29 Apr 2025 16:07:42 +0000
Message-ID: <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
References: <20250428123132.578771-1-pmladek@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0088.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::8) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <20250429160742.9285-1-gargaditya08@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: c015924b-c768-431d-2438-08dd8738031e
X-MS-Exchange-SLBlob-MailProps: Cojqxok92mqfKcxoajxhsed+mnjicdeu3zYjMch3odlpFLEecKoyzqxPHZNyX49jnnzKka3oxfYHVTsnXAEILKFpv+zTTC9Nx5BtNHeT1JyoG/ivEFaCiaWs598Z5bLi8Ib4ChKGPYDAMscWHPvzT3Qi1Zg+RKkt7kpV4ZCmKTDZ802XVgM7It9C0p74l2vMmOXd47royIOGN1nTj+2fzTihqq6op0Ali1vyO4YmpRViZTZVar8DWZBWxMu4IUvAqw6SOGkVMozHFHnM54MjLLLAFSYEWWsNkKrJThR3jCrpf5D2PaEpYttaFC3GXGCUIf7zoxfyBL02MYFRTbQdt9p3t0EzYo1y4Oa80ohMtK5PZl4RuQarWJizMwMekIddKFlUfXysrE6Pp+uN/9Ypy5jPBhiSmTwda/EPDlct4Md7BXvS+r1sXldygPbGqJLZZaGLLF9Mmq3Iq8SBmQ/OfxmGA0gU8yYiIo6rDlJWELD4CRSJcze3Z/nqsECQRNO8kQGNlkBbEYMaiXfUmqgK4yZ5pXG4Gv05bg6XhM34ZqXASg4c+pHA6OgWdv+lGyBY14dXWCIYmMmsdJHQ3SSJ4xcW0J2Tkfe94eFWHAHnkHtPomHFPdviC3GRvFfz0gvRNYknOpCUv6WxdP+PiugQHK9UEWJDssZ4EeVTaSDJR5ZZUikZZA7Arp4w4Pa0w0Py
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|5072599009|15080799006|8060799006|19110799003|7092599003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FEvBSJvoICtJF05YaH3X9E5exBX1kLA50hawhCBAvVfuWMsOUTFUnCM0qlRu?=
 =?us-ascii?Q?safMYKlyM8oR5As4vUkqr+vxTsg8GxKjaZHk01JF3SSl5N525Z1cLxnFb/FE?=
 =?us-ascii?Q?mj26xxZt5I+0f1oy+eZx0lXRkfuYaOxwyPKy87t8KSFC7olvGtv4jrs4JXe6?=
 =?us-ascii?Q?vCyLnLqy4fRJ5Sa8ULH1ajC2HD+YGNu0MbpsSbodPIfrufHOeoNULEeaenF5?=
 =?us-ascii?Q?I+DqPR/MDc2uvhbbQa5m3+kITa2MvXc52xeNQfxanSjY0d9CFGcC3m5WuwHN?=
 =?us-ascii?Q?EVqVwzjdGsAf9ogR9AK/2mXlDUye/rWZ3EbtmjSCKNRqX3vXDHuDdgNXLfGR?=
 =?us-ascii?Q?nwLXMtQ7nwD8QsvbJguRX2w8lVENjQRl6NSNzwYNA4fi5CoufiOZPNc8Rn8v?=
 =?us-ascii?Q?PPX3QrVW53vSfyULRbh6zDrI2p625yj2ydKNRsaiHRHFytVIUkMKt/Cly43b?=
 =?us-ascii?Q?usPB8j+hjtChyVsstuifDm2SgydN+LfgzyvbCgxGqNHlI3D287SsbboAsfzE?=
 =?us-ascii?Q?bdqvHasD+vRZmqd1sYBAn9aLcVWr0VthGAtlvc+YjeNr0A42qMA1Y/3IOc4W?=
 =?us-ascii?Q?I89ftrC5+IZJs+Fx3MwCvRQe6+zGNfdLotgKOVybuI8JbB+q41tn6C8hdSfv?=
 =?us-ascii?Q?FlZdyLC8tPKrUdxpMqmvlZ1nCEDt3tZD3m6ey7gxcGdFOQH6/pRikqjpOfFd?=
 =?us-ascii?Q?jzeEAEbVXIydnKUNi1RpyTCV1vveCyBI2+dXPf64xn3ZHTZsNAARDavxs/yS?=
 =?us-ascii?Q?VArOi6yXyuWLT8n4Bno5ylL2n7YvjoZM233xG+SThOLpga5J4tyYtZMwlVMJ?=
 =?us-ascii?Q?52EsZVWKYOwODv2AGEb548sN5NoXCCTuaNsPYA81QotP2f1ZGeTStUBKWYAo?=
 =?us-ascii?Q?zLNELw4vkg011Png+tM8kIiA0LDUsKR7bYb0jCWNcjQgEApt0eTO7fHt7+6l?=
 =?us-ascii?Q?0AxUZ6nlBOHFgYAHGxXN+NgdXrpCCU3U7IOsV7bILWDKPbeAb4//0wQUN+Pj?=
 =?us-ascii?Q?r8YiJGWSE6nkxyPVz5tkiU81wdgeL2opxhJVgTFzgWrnkBIfDO0J4W8Jf/Lt?=
 =?us-ascii?Q?xyEdMXw1P7qAnUNmUxvYOMDsXgxdiSNa5OKDtmKsW8gaDr089hvyLFLVCjjr?=
 =?us-ascii?Q?CCGDDVcJB7MMeQwFw9fWTuMC27tKDWUXCg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WIpQWpaXU79VThm6XkxwvMtpQSO9Gm4AKSdPktX5ZNxLEnwnfn4OBQHoScdH?=
 =?us-ascii?Q?engq7FK54bC66Eji5TkqdZwmSt3WQMi7B6G8XPDpZ9oE/43xDNKjIiSzt5iW?=
 =?us-ascii?Q?JwHtEmgIN5nDhcTzrwiEnDl4SLxfiRl9xb0Xro7jm5tAy+S4hakZMUqH5qz4?=
 =?us-ascii?Q?q5VlGdsdhNM6r1aaOg6amM2SvTOAA2KpPUS+S32LOggr82s+KVQQA9EwYY99?=
 =?us-ascii?Q?vTJXu2keyOo8I9Y9NjxZSSZ4qlNAKoJccp+RhWyWePUwV9D96UsUOMVdvmy5?=
 =?us-ascii?Q?C1M/72USXRnC9laaua0nJ95psws/rtcdv03kMZTEsbBrdBHqvt1KGYw1jj8I?=
 =?us-ascii?Q?jg3Y0ACUHY1SStRn3K8JtNQ4IPOd9VBj2qhAQiQ0isJJDnoJqn1A5+pYgS1x?=
 =?us-ascii?Q?4Eb17pyJks2mYy6br6gR9P1W1YQhBPQAiogDmigl5yVtl7G9Dyl+CSRwjEU+?=
 =?us-ascii?Q?6e9NwnqHnvn0XpsgaoQ3yUuesS+X3tuFef/hxVbccAuvWKGuvAdIg2erxoMp?=
 =?us-ascii?Q?c7Lm8kORVUWtuACLMJ/8Zr5oTPnce2CeSbA17rpMdK10W9ZFoZOg8u2N+l3D?=
 =?us-ascii?Q?WlmdnV2lnyxIvDSE1YyK3XdHCgxL0rc5/7Hwh7e/WJKkVuhmYhhwy7M3m07W?=
 =?us-ascii?Q?bwBdUMjCHsTMPQY3RehuvXLlI/5xn+OaCy8u5ujOQG05ziE7NQ+9rod6TQae?=
 =?us-ascii?Q?/M1upSWgpgFF+s9Ybe76eY3IjH5/g+2Vf9OOzh9HB1eZOlkq/0k/IXFns/lT?=
 =?us-ascii?Q?t6tzqL2htNY61bP8dwVu2FODvAmF/2KL/ygQlQoovwcjBrrs+j0/f3c2wbIC?=
 =?us-ascii?Q?r1tlGYvW6RKgPHQrLl7W2xxQzfqOdTIjnKOPrWmk8S96aYBwxGDM5SBBEGHd?=
 =?us-ascii?Q?4HkBj0LgkJZwjeOBkT7rXVxfIVmoDTtjQMMJznP0MIAAdI9noCmVa492yYCb?=
 =?us-ascii?Q?suqpZDaW+tfOLLUGWfHn6vPMPNRVK+EAEfCBaAtQdZJKv/zY5zQxQqdefFQa?=
 =?us-ascii?Q?BNiKeQ1zhM7ZCh8tAeqnLTvJHifiG4k/SK1qjaXPqDj7zwFhU1LuZT9El3bx?=
 =?us-ascii?Q?h/U6KdMPqxN7vb4lJK4N1CQi5ZdlRme6QEm8GiFfH0dw+cXhEf9FSqR5ke9Z?=
 =?us-ascii?Q?+bZ5g2x+Kz5rBN5tWrwXtTXymp+IwdPfOK81tDJ4MwkN1nbBYRIz0mVLnGr2?=
 =?us-ascii?Q?UGecO1sF6M+kBRuKAbtlToQ8YHyqCRadZ5dEfnm8U0hqHxO9E2XR4RJRH+Y?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c015924b-c768-431d-2438-08dd8738031e
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 16:07:59.9417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9769
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
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 44e233b6f..f79f0a085 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6891,7 +6891,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
+					     defined $qualifier && $qualifier !~ /^c[hlbc]/)) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.49.0

