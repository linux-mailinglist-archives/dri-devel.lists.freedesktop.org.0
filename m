Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CCDCFCC5E
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D09E10E562;
	Wed,  7 Jan 2026 09:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="eq4RG5Fv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazolkn19013074.outbound.protection.outlook.com
 [52.103.74.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976010E00B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 05:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Il1ULeXByEZn9nFUY0Fi9+SzhkR8S43qC083xCKJEBABK4bumai/R/0JAxaLJuArXd/b9f4JIQhXeveEQZ+wzgcGQXTMO3I4jpZUeZVaXCin777M0QtMedniZWsw5jAoPTrv+/Hbw5+lEWuucKxcl676jVqt8Y9RqMkgnuUpSb5ETFGkpw6urlJQ53skmce/R+WOgJGQ1QzSuBoDBHsA/gsBaCI4CDCpvpGZv3KCf3Qg6Uj+zXDl7nAjsl4uKnLzUih7oQfCjlB8HkNF/Oi49bLGA+vXyzo+3gQjoHjYo4bF/CQWKIvGcZrILCYfEaFYPfjTCDohOHx07fU4EXXFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov8QSRcFl8T7sphLOEnNcfr+wXI8BOyBlKXBXyN8EN0=;
 b=Ve7IQa8ILOch8d2MjT3J5z5gaxWartzTNStoGSVXHKKfwvMlkcgs7TACAzoAB6C8JVvSG5KjYzoKT1I4eUW129gpbuTiYJa9bR2Tk2RwbrGyL44jgUEzhSEiiveIO1LSf4FtMX66+LjkXQherv0Mnty3zSewcDc0wL34MVYYdPfO+kXxH+551OPPvheXJpjTGOg3+W3whgVl5/DT8yCkj3+dTrkOjNT1aXPThldMX4jTq5N9n2WQ9hQ0PDUG5XqXJJIh4eHylogEjqwcbENB2W1Rfh9bIOnTmwXUdaA93duRlcn3em2vz2ypt6+Yv3dNJqBmOJruh7Fyx/hNkPsPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov8QSRcFl8T7sphLOEnNcfr+wXI8BOyBlKXBXyN8EN0=;
 b=eq4RG5FvoIbNmQFXxInHPV+vNbJfkMfGGHdMFGhfO327MZRiutlH15+46bzcTuDMXYUJ4l+ndEu52AYIn8sVhrvd6qoTOXUXqTwxf950EHuUPTiE3FtTw/HpMcGIhIW/twLoQ4QFkM9SxYoMLAZI0h2kyUYFqrTEHkDLmvzy7XNz8xS2WDcuVAlKyQ7Iaiur7hhKvxwEtELfMXjMkVT2TeOTHevezmWuKFwWTZkDmfdI4mctdKoyoyxb3EM+7Waql1hk3ENqG5m1XXywkiaM6APwyRAyl+o1QYMeDJGWioZxdjy+FpLJjaPgnwopI5hDNYmrykzp6Cr7e/voONU/tw==
Received: from KL1PR03MB8800.apcprd03.prod.outlook.com (2603:1096:820:142::5)
 by TYZPR03MB6448.apcprd03.prod.outlook.com (2603:1096:400:1cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 05:40:11 +0000
Received: from KL1PR03MB8800.apcprd03.prod.outlook.com
 ([fe80::95dd:dd8:3bbf:2c16]) by KL1PR03MB8800.apcprd03.prod.outlook.com
 ([fe80::95dd:dd8:3bbf:2c16%6]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 05:40:11 +0000
From: "WangzXD0325@outlook.com" <WangzXD0325@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "rcu@vger.kernel.org" <rcu@vger.kernel.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "syzkaller-bugs@googlegroups.com"
 <syzkaller-bugs@googlegroups.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: [BUG] rcu: stall detected in kcov_ioctl() involving DRM vblank and
 file release paths
Thread-Topic: [BUG] rcu: stall detected in kcov_ioctl() involving DRM vblank
 and file release paths
Thread-Index: AQHcf5frF9Jv93rX80C4aHuhxfqbEg==
Date: Wed, 7 Jan 2026 05:40:11 +0000
Message-ID: <KL1PR03MB88000DD926BE92C97621C4DBA184A@KL1PR03MB8800.apcprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB8800:EE_|TYZPR03MB6448:EE_
x-ms-office365-filtering-correlation-id: 2f5363f8-aed3-495c-6732-08de4daf39b3
x-ms-exchange-slblob-mailprops: HeyTOiyEx6ZhckDxAq9Edwy3NVcpSjyvfAsovdwBVGp1rCJ5ZWd6XbRVfJLmbvk4CwRPgbRSHGR/AWCPQCCbShzDje9zf/cvIsucsekXZ7s8ljeGfuyn5TpuxA7ZrG0bzrG+3tWr1jThqfrXJrEk3NtYawJd/LXGLAUnpIaNGHtEybQhSrUZu8spTtXdjzWeP0LVQiShp38R1aeDyjNy/Z35xOOfqO632BT9tx+ESQN1irx5kZrHKYUbzxv1rW4UYmcQGBgzUvUHg5yiP6oUDrL0yujsdfOQqb2s1zYQn615AeMMgbcvBhteNi04dZybhCTZceU9L0lzBuEqfeNgkOcAOM8E0ePzsBn5IOQXUp6t5oWDmRoGo/SvB2EgR5skfdI7QnO6WWWw8C1YDq2i5LLkhP330zRtHXhPwTvyyrUYUIi1vHzK8sqCrjpv4gaBxdCIKQCRh7hCm5XFQPe8MGAdrSqnlGJ0r//pf3tvaWJROwZKTLYaLZxFjIooNm+tUnnuAUEe8FlGipgXVxMPsSnac0cyBtfaLPpL5UZaS50fVXUwwogDaKwkZbjanG1dzQihdY/EmVMfGP0aUHRJPdB77DAGiLz2Nreg3IonFqM/2s4jFKI9PremQmc0RIcxTY7z+fMp1TmtunnvK6KuF7T8hYYyL1iVMga336s/c4zN2mKbLQ3lMRfcCjCCJyTGxWoYyzMjaIWaHp7GZJrnFFR3Fcc+IfUXuqsj+kJbPFnMJaQOLzfEnmm8SArRmJGb5/03dHIHney6Qk5ZLld2Bg==
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799012|15030799006|8062599012|8060799015|19110799012|51005399006|31061999003|461199028|440099028|3412199025|40105399003|12091999003|26104999006|102099032|3430499032;
x-microsoft-antispam-message-info: =?gb2312?B?b1lNVEZlbTRvMXdBdllrNEt1L3FXVnBpWEQwditjNlVHUUFhVFo0c0lVSkRW?=
 =?gb2312?B?NDJQRElaakplcTAwM2VicW9iQUQ4Tzl1bVlQY2FvUHBNY3NwaHBhVkZCT3RI?=
 =?gb2312?B?UDJNcGxDWk5SV1lkMDVmUDFwVDFYeEQyVEZRZng4RjcxeWJXT2p1MVVDRW5U?=
 =?gb2312?B?NFp4ZzBxYS9zSTNobmowR0UzSlBWRFZxOFJqcW03ckpiRHJBRmdqVWF4MmlV?=
 =?gb2312?B?K2RvZENLQnlsTkF4aHh6Q3JIV0FFZTJCb1gweUQ4UkgzeEpvd3M5V25QSndQ?=
 =?gb2312?B?UmZORUdndE1yNTJCK28yMkViUEI0SG5FQkZZSzJzSkkwYmxQZmkrUGxFSGxN?=
 =?gb2312?B?RkgxSmwwbFg3b2FhNEJDNlhJNUk2MWlmVVd6M3lDTEFYb2pxQTZQRExNWGxi?=
 =?gb2312?B?T1I0NEJTT2NwaHVHRFpwRjE4cHh1RzAzbXJLTXlja201UVE2WEJ1cjN4VEFJ?=
 =?gb2312?B?OGhNY3dHTGd0aDZtM0U3blpqQjN6dDdxUk9pZmoxNWJBNlBic0lVeXhQZnZj?=
 =?gb2312?B?c0E1QmNwQyt3ZFIwY3hZNWtZTFI3M21NcnJxYTkyRmZvV1M4RDN1aURzOXAy?=
 =?gb2312?B?YWFyTWxBYzdKQ2s0WTRNZStITGZQdTE4SE5KeHZOblpidVFSbFpac1dvTGtY?=
 =?gb2312?B?SjVxUUhIeWhJd1RkaVArd3R2TU9XRmdZYUZZYm01bTdwbXdSZGF4UWNNZERz?=
 =?gb2312?B?MFM4SDVFVlc4MG5La3ZwbHJyNGkreVdLTXoxMkZCYXJHb2lvcFZ2cTJqZ2k1?=
 =?gb2312?B?UW5hc3ROdU5jb3Jrbk5hcFp0NGM5QmMzWVpOdDltMmxPbVlveHJmcjlUZ212?=
 =?gb2312?B?K0dXSFNRYlJBd0RydnBKeE9GTTBiMkFLMmFQRklDa2dLSjhmRWtqUUNMRU5a?=
 =?gb2312?B?SHl6d1dCS3B4YW9PRGFPZ0lzSGhTaVNGT3RyZ1k0VFgyekNKUjZ3VDQrNytu?=
 =?gb2312?B?cVBrYzdQNmppWm1PbUdTKzdiRTkwYy9ya0w1d05kM3Yvc2hsWm9aK1RZNGhQ?=
 =?gb2312?B?d2R3dDZQMWRqTnBBbHBvT2FCTDg0ZzJDUHA3STlIcVhjZ1VpaVZkbFhSMDky?=
 =?gb2312?B?Q3ZTTC9EL3Jid0N4V3lyaHc5ZzBqOUFCS2FxUGFiRzJWa010N0xScTFyVExu?=
 =?gb2312?B?UDM0akc1Vmk2NGFiTzBLdlBONHBMUEV0U0VMcWVnR3VDb3pRWEs3dkQ3dkhq?=
 =?gb2312?B?MDM1TlYyMmJ3NlJrYXVvN3NLRVVZVDB0bC82NnRQVlorL0dvbGxnOU9FNmgy?=
 =?gb2312?B?MjhwYjhLM04yV2s3dEh6eWNtN3hYMTZscHcwQU52aEhFbDFrWHRSWSs5NGU2?=
 =?gb2312?B?L3FkK1dIQit1MEs1ZGs4YUZoYVV5cjhjTkJRN0M4NmNmelEyOE96ZCt0ZUh6?=
 =?gb2312?B?NXpJb1dUUXlMOVFRVERmZFBrV2t6USsxTXB1NkJqVW8xTzdLWGY0U0t3a1Zh?=
 =?gb2312?B?MnlyMTZ4ei9aRVNDY0NHcjdyaHhmcGpranFJcWtEOWg1VHRKREhYWng2aURo?=
 =?gb2312?B?QnUvemo5TEl1dUY3Mm1VWFRKMDRUSVBTMVJiTWxxclVmYWo3MkRoN0IyczlG?=
 =?gb2312?B?NEVxRmJoU3BKNzhUbUxOdkJRd04vMzlhaFBXVHp5RkZwNkZDNHU5bWFBZkJj?=
 =?gb2312?B?dFlZVUh1K2pvWmtSdXQ3Tzdla2VObys2MFdOb1pkZVFQRjBNbGtPTGZOM24w?=
 =?gb2312?B?VlNUTnAwdlp3Q0E5Q1R6VDE4cFhDaU9Jdk12YkhqSnlPZEM5M3hGSU9nPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?MWFwNVdoQmNqak9LVjhZTndRcjRkSHFGdHUvNkUxWG14L09qdmhiWUZCVWJC?=
 =?gb2312?B?cVdPUkRRaTFsUUZab0tmOWxjZjdpV3dNYlFReVVpdlFWa3hSNWg3QWpqTU9a?=
 =?gb2312?B?NG14aExoYWEyUCtYQjRsKy9od0J4azRwVzJoYU01OHdkVFFmUktRMVcwNytv?=
 =?gb2312?B?TGRFWC9DMDFUS0dVZW1GVVp0VzVHWWR2bmZlcW1JaEc2Q21jUCtJZWwxKzdT?=
 =?gb2312?B?NUZvRjhxc0Z2MzZpcTd0eDJqQkJSVmYyWC9LNVZkSUZzVkZtZjZFWXZDcFg2?=
 =?gb2312?B?L3VNcjZRbFZYZFBMWm5EMlhDVEZoMWMvTG1yU2lvR3hMWnQ4dGlWdUpuTXZ6?=
 =?gb2312?B?Z1FoN0ljQlJpRzlHR0x0UUx6RU92YUE1VFhEanlZTmlPUHFLWXhCeXkrOGZK?=
 =?gb2312?B?YmhnSklhVnNmclIxbnVRaTZGdFFwTUpsMDlLQ1BRTEJlOExxZ0NUS0VTVmhH?=
 =?gb2312?B?QVRkZThKSC81Z05yaFc5UHdweTFKVlkrQ2Q3TkZvZFV5ZW5UNnAvK1lNYlFK?=
 =?gb2312?B?Zi9yVmlCOXhjZU5QOWJjV0J0aVhOS0k2dG80UUN4TGNsOUpFZ1VscUl4b2h5?=
 =?gb2312?B?Y1VLdFV2clJzdjNRK1hTMk9PakQ2SnBYTTBMZlpsVzBXV0Q4aFMzemhCcC9q?=
 =?gb2312?B?b1U4QjQ0djRHUndXTHNhcXJNTE51Q3V5VkpVYmFESHBGVVJQeUtyQW80T3hF?=
 =?gb2312?B?U3F3eXAzbG1wNkpvaTZzY2JuSXBhcnMzN215MExaczhNeEY1NG1Idm1rT2V0?=
 =?gb2312?B?MkRPODh1ZE9uTHR3dEVYdE9MMWRSbDk5UXorR0YzdmRuWTJaVFhWUGVReDZO?=
 =?gb2312?B?Nmp2S0FYOFJ6QlhBbDQrdklPNng5MitNR0FmODFpZ0RnQnVHOFhxVnJnTy9o?=
 =?gb2312?B?TjdZMDh0NFIwYVBsRThSTnV0eVpqaFFIMFdhd2EwVTNsTExpMXorZVBzUkJU?=
 =?gb2312?B?Nkt5QnRxeU9EalljMmNBMWpaeXNMSDBEaTA5VExkZGZXc3NRM05jVkZUVUVu?=
 =?gb2312?B?am1yaGZkR0dXclJXWW9TV3FPdTNrK3lUT2V1aFg1QVkyaHg2U0paOVFOZUZq?=
 =?gb2312?B?TFlFT2lHNG5QN1pnR2RiY2t3MVgzMmkvNmxjMFBqWGNCOVk3eStHM2o5aEl0?=
 =?gb2312?B?RVAxSlpRTjBzYW9vNWExWkIxRk9DZElncXVsTnB5ZkREMXJac2xKYnR2SmRU?=
 =?gb2312?B?L0llTGFhSGY4dUg1U3lSbGZ4bjNUQVkxM2lsNVl6K2doSW0vN3Z5UkFTRm1s?=
 =?gb2312?B?WmJ6MjNMRVR2ME1BSXNRV2tFeFJVd0FNcTZUbFhNcVBRTzlVU0pNL1k4WVFI?=
 =?gb2312?B?VmdMc1VVQjBXOWdROXlsejJnZDBneVNKZ1NieGtOR3Y3MTBaMExhZ3NaejdM?=
 =?gb2312?B?ZzdoMC93OE9OcXJML3FFQW1XSEYrMFJYWjdWejgxa1R3V0NqNDIvMWxCU0pt?=
 =?gb2312?B?b1ZvekROYjU4c2dKSWoxTGNHdnV1dTBhTWpzbjdxRThDWHp5a1dLNW5OMzZ3?=
 =?gb2312?B?UHNyR0hNd0MxSjFySVBpcTA1RDhkK3lWWXp5RlNsTzdnUFNwNGg0Tm1MeFNK?=
 =?gb2312?B?M254R0RYcm9nWU03RUV5S3ZtbGpZQW52U3BqRWRTbUh2d0UyeWZsUWpVT0JO?=
 =?gb2312?B?OG5MYkJObFFnTFJXQXh3eDJNUFBOcCsvUXNSQTc1MUpTMnc5b3QwTm9xSndC?=
 =?gb2312?B?VUlub3JqcHk4NVF0cHgvVlB0Z2tvcFh4eDlXTFRsUG1DZ016NWpReHo5b3Ev?=
 =?gb2312?B?ZHdkTjhheGpaR01sMldYeUt2QWR0aTVQOExrRk16OFBEMHVZK0xLVFd3SWlv?=
 =?gb2312?B?NjR2RTJtc3dPM3VCc2hvR1UyeVF0R09tb2RKczV2MytOYjVJY1FyM2NaRzJD?=
 =?gb2312?Q?3lZHUY1ms7KpU?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB8800.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5363f8-aed3-495c-6732-08de4daf39b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 05:40:11.5392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6448
X-Mailman-Approved-At: Wed, 07 Jan 2026 09:14:13 +0000
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

SGVsbG8sCgpJIGFtIHJlcG9ydGluZyBhbiBSQ1Ugc3RhbGwgZGV0ZWN0ZWQgZHVyaW5nIHN5emth
bGxlci1zdHlsZSBmdXp6IHRlc3RpbmcuClRoZSBzdGFsbCBpcyByZXBvcnRlZCB3aGlsZSBleGVj
dXRpbmcga2Nvdl9pb2N0bCgpLCBhbmQgZXZlbnR1YWxseQppbnZvbHZlcyBEUk0gdmJsYW5rIGhh
bmRsaW5nIGFuZCBEUk0gZmlsZSByZWxlYXNlIHBhdGhzLCBsZWFkaW5nIHRvClJDVSBncmFjZS1w
ZXJpb2Qgc3RhcnZhdGlvbi4KCj09PSBTdW1tYXJ5ID09PQpUaGUga2VybmVsIHJlcG9ydHMgYW4g
UkNVIHN0YWxsIHdpdGg6CiJJTkZPOiByY3UgZGV0ZWN0ZWQgc3RhbGwgaW4ga2Nvdl9pb2N0bCIK
VGhlIHN0YWxsIHBlcnNpc3RzIGZvciBtb3JlIHRoYW4gMTAgc2Vjb25kcyBhbmQgcmVzdWx0cyBp
biB0aGUKcmN1X3ByZWVtcHQgZ3JhY2UtcGVyaW9kIGt0aHJlYWQgYmVpbmcgc3RhcnZlZC4gTXVs
dGlwbGUgQ1BVcyBhcmUKb2JzZXJ2ZWQgc3Bpbm5pbmcgaW4gbmF0aXZlX3F1ZXVlZF9zcGluX2xv
Y2tfc2xvd3BhdGgoKSwgaW5jbHVkaW5nCkRSTS1yZWxhdGVkIGludGVycnVwdCBhbmQgZmlsZS1y
ZWxlYXNlIHBhdGhzLgoKPT09IEVudmlyb25tZW50ID09PQpLZXJuZWw6IDYuMTguMCAobG9jYWxs
eSBidWlsdCkKQ29uZmlnOiBQUkVFTVBUKGZ1bGwpCkFyY2g6IHg4Nl82NApIYXJkd2FyZTogUUVN
VSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCkKV29ya2xvYWQ6IHN5ei1leGVjdXRvciAoc3l6
a2FsbGVyLXN0eWxlIGZ1enppbmcpCgo9PT0gVHJpZ2dlcmluZyBjb250ZXh0ID09PQpUaGUgc3Rh
bGwgaXMgZGV0ZWN0ZWQgd2hpbGUgYSB1c2Vyc3BhY2Ugc3l6a2FsbGVyIGV4ZWN1dG9yIGludm9r
ZXMKa2Nvdl9pb2N0bCgpLiBUaGUgY2FsbCBwYXRoIGluY2x1ZGVzIGxhcmdlIHZtYWxsb2MgYWxs
b2NhdGlvbnM6Cmtjb3ZfaW9jdGwKdm1hbGxvY191c2VyX25vcHJvZgpfX3ZtYWxsb2Nfbm9kZV9y
YW5nZV9ub3Byb2YKYWxsb2Nfdm1hcF9hcmVhCmthc2FuX3BvcHVsYXRlX3ZtYWxsb2MKYWxsb2Nf
cGFnZXNfYnVsa19ub3Byb2YKQXQgdGhlIHNhbWUgdGltZSwgb3RoZXIgQ1BVcyBhcmUgZXhlY3V0
aW5nIERSTS1yZWxhdGVkIHBhdGhzLgoKPT09IFdhcm5pbmcgZGV0YWlscyA9PT0KUkNVIHJlcG9y
dHM6CklORk86IHJjdV9wcmVlbXB0IGRldGVjdGVkIHN0YWxscyBvbiBDUFVzL3Rhc2tzCnJjdV9w
cmVlbXB0IGt0aHJlYWQgc3RhcnZlZCBmb3Igb3ZlciAxMDAwMCBqaWZmaWVzClVubGVzcyByY3Vf
cHJlZW1wdCBrdGhyZWFkIGdldHMgc3VmZmljaWVudCBDUFUgdGltZSwKT09NIGlzIG5vdyBleHBl
Y3RlZCBiZWhhdmlvci4KCj09PSBDYWxsIHRyYWNlID09PQpDUFUgMCAoSVJRIGNvbnRleHQpOgpu
YXRpdmVfcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aApkcm1faGFuZGxlX3ZibGFuawp2a21zX3Zi
bGFua19zaW11bGF0ZQpocnRpbWVyX2ludGVycnVwdApDUFUgMSAodGFzayBjb250ZXh0KToKbmF0
aXZlX3F1ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgKZHJtX2ZpbGVfZnJlZQpkcm1fY2xvc2VfaGVs
cGVyCmRybV9yZWxlYXNlCl9fZnB1dApSQ1UgR1Aga3RocmVhZDoKcmN1X2dwX2Zxc19sb29wCnJj
dV9ncF9rdGhyZWFkCgo9PT0gT2JzZXJ2YXRpb25zID09PQpUaGUgaXNzdWUgYXBwZWFycyB0byBi
ZSBjYXVzZWQgYnkgYW4gaW50ZXJhY3Rpb24gYmV0d2VlbjoKTG9uZy1ydW5uaW5nIG1lbW9yeSBh
bGxvY2F0aW9uIGFuZCB2bWFsbG9jIHBhdGhzIHRyaWdnZXJlZCBieSBrY292X2lvY3RsKCkKRFJN
ICh2a21zKSB2YmxhbmsgaW50ZXJydXB0IGhhbmRsaW5nIGhvbGRpbmcgc3BpbmxvY2tzCkRSTSBm
aWxlIHJlbGVhc2UgcGF0aHMgYWNxdWlyaW5nIHRoZSBzYW1lIG9yIHJlbGF0ZWQgbG9ja3MKUFJF
RU1QVChmdWxsKSBjb25maWd1cmF0aW9uIGFtcGxpZnlpbmcgc2NoZWR1bGluZyBsYXRlbmN5ClRo
aXMgcmVzdWx0cyBpbiBDUFVzIHNwaW5uaW5nIG9uIGNvbnRlbmRlZCBzcGlubG9ja3Mgd2hpbGUg
dGhlCnJjdV9wcmVlbXB0IGt0aHJlYWQgaXMgdW5hYmxlIHRvIG9idGFpbiBzdWZmaWNpZW50IENQ
VSB0aW1lIHRvCmFkdmFuY2UgdGhlIGdyYWNlIHBlcmlvZC4KCj09PSBSZXByb2R1Y2VyID09PQpO
byBzdGFuZGFsb25lIHJlcHJvZHVjZXIgaXMgY3VycmVudGx5IGF2YWlsYWJsZS4KVGhlIGlzc3Vl
IHdhcyBvYnNlcnZlZCBkdXJpbmcgc3l6a2FsbGVyLXN0eWxlIGZ1enogdGVzdGluZy4KCj09PSBF
eHBlY3RlZCBiZWhhdmlvciA9PT0KSW52b2tpbmcga2Nvdl9pb2N0bCgpLCBldmVuIHVuZGVyIGhl
YXZ5IG9yIG1hbGZvcm1lZCBmdXp6aW5nIHdvcmtsb2FkcywKc2hvdWxkIG5vdCBsZWFkIHRvIHBy
b2xvbmdlZCBSQ1Ugc3RhbGxzIG9yIHN0YXJ2YXRpb24gb2YgdGhlIFJDVQpncmFjZS1wZXJpb2Qg
a3RocmVhZC4KCj09PSBBY3R1YWwgYmVoYXZpb3IgPT09ClJDVSByZXBvcnRzIHByb2xvbmdlZCBz
dGFsbHMsIG11bHRpcGxlIENQVXMgc3BpbiBpbgpuYXRpdmVfcXVldWVkX3NwaW5fbG9ja19zbG93
cGF0aCgpLCBhbmQgdGhlIHJjdV9wcmVlbXB0IGt0aHJlYWQgaXMKc3RhcnZlZCBmb3Igb3ZlciAx
MCBzZWNvbmRzLgoKPT09IE5vdGVzID09PQpGdWxsIGtlcm5lbCBsb2dzIGFuZCBjb25maWd1cmF0
aW9uIGNhbiBiZSBwcm92aWRlZCB1cG9uIHJlcXVlc3QuClBsZWFzZSBsZXQgbWUga25vdyBpZiBh
ZGRpdGlvbmFsIGluc3RydW1lbnRhdGlvbiBvciBkZWJ1Z2dpbmcgd291bGQKYmUgaGVscGZ1bC4K
ClJlcG9ydGVkLWJ5OgpaaGkgV2FuZwo=
