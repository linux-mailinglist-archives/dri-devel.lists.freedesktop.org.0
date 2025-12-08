Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14168CACE69
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9F410E3FE;
	Mon,  8 Dec 2025 10:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mobileye.com header.i=@mobileye.com header.b="e3mM7Kok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011057.outbound.protection.outlook.com
 [40.107.130.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9237310E3FE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:39:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liDPEi4B4L0vfQ4qypf1per97tnmxhKCiRg3ATF+/gWZmD2DJdTlLWXdarSwoAsNakUHyYBwFvlMZhP2FJZ3pm+r3BL6dXhzdMUUVH6RInpoeRh3RckxZ2MGSs3OfezxuSFa5HNNwwCS4zZemMXA6M17RiJz9vrghekWPi7y4VxRFMVEghWOjZ9B0LD8/C3gRJ7wkmQZELWwo6pteLwsAQ9Pr7jH5MI4rwTLqvv/5abD56XUJ0ui+oTuoGzE6GbmZIDO32VrbasrTlDl2XsrVzRKiEpU+rStaGvMzQCta2RAv0/hkF3Y26EL8c6EOLYX85kmfLvy7zOECqe86qiqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw2L6fHhAhgn7FwD4uTas4hS0OtYwhnUK7NEmIXx4A4=;
 b=A5d60zsN2gDOtmUNvfCTsohQvzkKWq4qJ8H/OpRKFzViQE697qcjZg5jJnKmKbHH51zxyddk4WLQ0lrCz7VWsJe4yEeTkDMt/nbDg4qVyqb1MM3v3OWVvFoCsBXZpq7bYgtmlvytfeUYsn0KcC9S+2rDE2Tw/52Gow23ZyWeDtfhbpbwPidFmg5aj25hXrt+6+IC5DZ7Ceg9l4BzXvBEceArEAhv9vGnAzMj3Ut/9cwRaD0rPABV3EUVJ9JL+Bd9xQbtk0Ls6j9sERHHZAc8usfwfzG8a2q3U11XVyj9AD02ZErjMfTLRbDQu/Gi/e0CfyPf0ksfLUnP4zRFUzgoqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw2L6fHhAhgn7FwD4uTas4hS0OtYwhnUK7NEmIXx4A4=;
 b=e3mM7Koka4pfdts2Q7BvzbelJyQmkdEWSfIlfShka4bL9Y/T5MxaRxmcvms+W21r2sek0etV67cmLk5cC4k8E5eJZvVHrBmeCqX/i+RqgYhZSQ39ZEmtxi42tXEFXjLC0zUUgXq9pKQhfoOH/aBK0FcMH+8abuGiIfqNaL8LViI=
Received: from DU0PR09MB5950.eurprd09.prod.outlook.com (2603:10a6:10:412::15)
 by PR3PR09MB4314.eurprd09.prod.outlook.com (2603:10a6:102:3b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 10:39:50 +0000
Received: from DU0PR09MB5950.eurprd09.prod.outlook.com
 ([fe80::d4eb:5345:73eb:f7f4]) by DU0PR09MB5950.eurprd09.prod.outlook.com
 ([fe80::d4eb:5345:73eb:f7f4%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 10:39:50 +0000
From: Gregory Greenman <Gregory.Greenman@mobileye.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gregory Greenman <Gregory.Greenman@mobileye.com>
Subject: Current fuzzing tools for DRM GPU kernel drivers?
Thread-Topic: Current fuzzing tools for DRM GPU kernel drivers?
Thread-Index: AdxoLj+7FTk3vEa9QESNuZiKnHgbNA==
Date: Mon, 8 Dec 2025 10:39:50 +0000
Message-ID: <DU0PR09MB5950E6DED142ED688B03B03CEDA2A@DU0PR09MB5950.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB5950:EE_|PR3PR09MB4314:EE_
x-ms-office365-filtering-correlation-id: 0fa1559f-6315-4149-d66c-08de36461d7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZpQkSZHhzZcjBDbgPxaQW1QdjCXxhOobtgH+6l1UarhOp534zu7cTYzyaKcp?=
 =?us-ascii?Q?s2lHEe3F8IDtS7g3WYIa0IhlS5OZ6Bu2u9m/yQets+wZvC1T6JEn4Dub8tmd?=
 =?us-ascii?Q?enrQZe1jy71TAs8T/SzkXM7tGtMXiBLJLeQ+ZsOG4Bgd1xkodW6QOZTX1rYv?=
 =?us-ascii?Q?GzIk8zmI95jHryxU18CuNSvUWj51d1QRD7g4CFvklomGAu6Dqqm+vpxdgnn/?=
 =?us-ascii?Q?RapFiZAoP5LiUr2ghSNH0PqU21JR6VIc7r89NXkTiRVxd1Qk7Mpid3M3uCUs?=
 =?us-ascii?Q?DJlfZ+Jb4BGNhUT41EE7oF/ixxAJff6OrFSwGGerBGADmpotF1YQEAIDCUfT?=
 =?us-ascii?Q?s/UJmYANG0t8Lk3ylJ81y7XM7HmEAZiATWK64JyIxOdXf01PX3y7oerbe/tc?=
 =?us-ascii?Q?0DlpoHzova1N/bWfqF3jW+Av9EIGY14SWlS6jd4Gz494vTHgssGNLCf4zL1V?=
 =?us-ascii?Q?kR9O9BtnOpvrCSFZCtuxaxl4wflxBqaQ/r1+voJ7Uj8BLgwXhgC/5vzkJORy?=
 =?us-ascii?Q?nJ9adWW02aKjUEM0ag8OifDPjlJzgXLAyB7CBoFSqHaGo6trRYBZ7zjbKFnx?=
 =?us-ascii?Q?oqh+5Hi5bn8hu3CDueKWvUHx0L6rj2qQUDZzBg/l/hxVbvo/e9UeTICDXFHc?=
 =?us-ascii?Q?Y4MCvBLhftnCRfx6vLaEf/3UmiwAz3OcqeGRB4ETbIPHXGGwmctQas1C4jZB?=
 =?us-ascii?Q?Gg5U6RpXLK3O+iCniP9Rm+Q09A10ZnJ4AADc9bFfi88LGTuvkz/fkeEz5SAb?=
 =?us-ascii?Q?gTsctsCIJtDZYSAgbvt2shhLDmr9CZme2cy1jmgsL8dkugQBQa5XbJ1VqSHS?=
 =?us-ascii?Q?CfnhpatZm5+gWHYLA9yybJNHYPqO5NWlt6Kk9JT6tAKJj7TnSBUijWsIhKc7?=
 =?us-ascii?Q?PeNeilzuj1jMkmHl4DyzRnGg9poW71iEqlhO63OarrOi0ItAjKSu6VHdoE/V?=
 =?us-ascii?Q?IAD4Pv4VtjYE3WVPNA8RRV/nBu5/pn48WU02qMGJsWOlEa7xlHqCw013EAu5?=
 =?us-ascii?Q?I0kRlDdBj9hk9TnNKkcoT2tTAZHyZ6umTdynXxug3k0wgDplxkLeeoFQoJoU?=
 =?us-ascii?Q?n+6aPm+0+GErckjQKRDK8JTd5Vz6I/XtNu2QFfU2ICFrmsNf+152gMh0UX1Q?=
 =?us-ascii?Q?V0DCvUDXeTRW6CDb01pt0mwoSHnFda5DuJcBZVY/P4UyLEg3t2/B0RXzfKQ+?=
 =?us-ascii?Q?TTilU9fuVScgJ5xpKiv0/sULP4m6urz/LZfrKmoxstNqM8g3FGehYiOXQxGw?=
 =?us-ascii?Q?Ou9AeXZzMxyUzjEuwM1RKn9NQPAC3oW+eLGpxbQgdXSlGTWY7vkYCE9FC1af?=
 =?us-ascii?Q?xIzaN6QqsTUrp1nxEgKlvfr7aD/Vqrd48DDsbSGPCNHA30pvWubdXGMraeJg?=
 =?us-ascii?Q?TmkBrkJSFZz1WjyFb1uaD0TDYvL+Mfxy0woW1ZojN/Tgiig7m+Xy94XB760J?=
 =?us-ascii?Q?TdyMVlkbwTIdQ66tN/BGM4tVlnXSaLmW9r1WY7O2oP88qsS+9pbPd8/SvTAA?=
 =?us-ascii?Q?+UCDtFM6Z6werB2mmcj+vEffBbeLDlw65mTJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR09MB5950.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GzPrme1MaSjCIxuxjdJnSxlvuM88a4ePjMqDh8WA6b9K9xj3qhHI/qf1zG7N?=
 =?us-ascii?Q?8jr3jmIyOoQ/gf2HnvbeTqaacRWCcPtl3gHSk0uBwqxNiB/sfCdDoeBcOZGK?=
 =?us-ascii?Q?ZDZcMyLWkoCknFGSeQm6N2JM42gBRpNHnrbJhXtBTPSvgVmphlV8ZVw1qb/F?=
 =?us-ascii?Q?MRR9RZRxsbT+RSiSwOA2XlGUZn/xxd5PkDMXJ8GDSDdW96uHICpUkqfd8dRc?=
 =?us-ascii?Q?H3q1i/CI0AsZ1Z+6sUO1/jhme9cIsClgYl1Bu+/Nqo0MuHRc7ING8IVDJfkb?=
 =?us-ascii?Q?yqLoI9qc1Oynf2EUeeUECIWs+des2/v+fDJn808UgGkeooqTxQw1H2igZQFU?=
 =?us-ascii?Q?m5Uc/B7fBFJEnrTT5QGu8Pe4ulj7Aw9wv8PGVKbgyiZ5fcgj62Z0yTNbV0Ta?=
 =?us-ascii?Q?U7cY9WbOoBDukaN8Ml/zllXpeXKynXvIKd6j79g/bXqLvyXH29EValQXziH+?=
 =?us-ascii?Q?s1y0uJtonqvBs7scBp8rEmPMN6Xja0kHlfDAzkBjF+94MjiLnau3ug1dW8dd?=
 =?us-ascii?Q?an9SVwZiaxDfFaLJUKa5cxeY0G8fGuZ/8rScNWcfmFJfCwC58knbngVlGHRz?=
 =?us-ascii?Q?PqsnhBJSEqmxzHidBJK0h94d1vMXZciyQh0RA7DdM377Z8sh//e9cvhBa0xh?=
 =?us-ascii?Q?vwQfohyXw+1yhTzf03sbYA9JY28eCzU3qrf1Gjtq8vaYXfXJr3TvUIlH+U9G?=
 =?us-ascii?Q?9A7yBNN0ngRQw8oBPkjf3vneY7bpdqDE5ASbaDYmE3hJUFe1TuBDSbSuW7Fj?=
 =?us-ascii?Q?yjfJeRKisNBDDaRUC6XnmJrR2JLwCWyEkvHmZo69GLv6N+iE3Jh6vNJUhX9u?=
 =?us-ascii?Q?RcwkBj+Jt3dHe4001wyQ4VRejNCOTZxfIVFJPQAqoXVhOoRnPRn3mkPjZBs6?=
 =?us-ascii?Q?k+7+xkcbDzwuUVlo8LGfYoSWsiUa168aSW6vOyrf+DW+gKvv6+1KDufBK2f6?=
 =?us-ascii?Q?2K8wSQf08epGhIQ7CM8qkZuV4Osf01iMowdVDG9eV9GvuINGxKwUhpPyFNme?=
 =?us-ascii?Q?9H1hlNYDWKRZAk5WtpZtXrvpEqZ67m/YhJDe5Dw17kd17Hb4CMR6W+CeJA1A?=
 =?us-ascii?Q?9/NgxDA6nXQCmh+GuHadtauCTlpOi8BhYp6FQXUPhz9bpp+dEVKc7i9n9UyN?=
 =?us-ascii?Q?T63HBAYX3Ksmmr+ztqUvH2wTNq3H6aHovTlaMNT3SR4ofqHE4xhEapggp59s?=
 =?us-ascii?Q?GMKNqudNCixADatY4lgB2ihY/0JrC07GFxpUEJUdr7DdeUoOiXzj/Es6Yga4?=
 =?us-ascii?Q?sNNO8KKPw1bSZtq1w2pBGwxy6KMGXalE/iV2kR9pDrXcyuNzjfch85DUfeDw?=
 =?us-ascii?Q?in5xrahJFirLIRSx01gduAOul3uzHBJQuKNCYBf2Fsv0CJcBI+rL6F9f+s2i?=
 =?us-ascii?Q?DGSpKVTJtJCxkpMKZDZXeg8arEQhmz/qhZ1bMb84mXGwvaTyvlWzYlEoUf14?=
 =?us-ascii?Q?FTu2TR9HSDY1YHGZ7u9G2DgFFlDbiBejdvMZH78K1mrMTMAzca4wHghKCnmX?=
 =?us-ascii?Q?lTlbsg2gGQ9MGCFpej3W0+Tds1eewaSwNxUTkFLTiNnR/m0/Ds22dMf4brzU?=
 =?us-ascii?Q?Ubwk0X2BwigySH8rkJy2qvvVhRR0MCaZ81PPSHeh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB5950.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa1559f-6315-4149-d66c-08de36461d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 10:39:50.3304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NfTXDCARr5frjdEFL3Ys4Ea41GWl+TPQlBDXIfDBMbe+1g3RYQ42Cw9ttoc+SXV4Mc+L5xNnco1fYPag6daq0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR09MB4314
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

Hi all,

What fuzzing tools or setups are people actually using in 2025 to test DRM =
GPU drivers (especially the embedded ones)?

I'm mostly interested in finding real kernel bugs (crashes, memory corrupti=
on, UAF, etc.) on non-x86/non-ARM platforms.

- Are there any active syzkaller extensions or other harnesses for DRM/KMS?
- GraphicsFuzz seems abandoned - is anyone still using it or a maintained f=
ork?

Any pointers or recommendations would be very much appreciated.

Thanks!

Gregory
