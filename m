Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED4C375FC1
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 07:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5496ECF3;
	Fri,  7 May 2021 05:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB436ECF3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 05:40:58 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1475dpJS029719; Thu, 6 May 2021 22:40:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=vhq2OzzGqlNUfOT613Vchw6U7A4WMC74Ea7d2ZnWYrM=;
 b=BcbCNAp4Q+lzhoxDjhVzN8cweIbJTIog0UJK2hpVz5q4/gIYfaes+powjVhZwlHakquv
 1HMXeAFo3fQgB29iyQ/sv9yDRBEQFw742/Lr5yvVrH39XWjvkGznRFTWP5zsIa0LcYhM
 SFNiNL7b/Iu4T7bkXyhuQqSbYVeie9mWLtLodfa8vtP3k/2lhsa7ZOUiJfEgri1NMWjS
 t98rOwxL3au2zrB17anL0vi7GzQ+SayFwuQKf684yPfcC2O+Vjip6Bn2LQ31KNet2RsY
 v7hcI8yXANrJT174D95T5k2pI39l9kX+05krSTL36KzA1n4b3pH3ZVSBFx+oJCPjwuga VQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 by mx0b-0014ca01.pphosted.com with ESMTP id 38csns92c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 22:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaWZxIdKqe0SIyg1XMAnHi4W4a1iRihm8BBI2R2x87WthI0K2K/lDiu1SW+mnM7w4wYs+sKENhNXFqzgPjvOkAapQY9+7LftAxxtzIbhwGTz9y4ZyalTR9DJhrUPyVYXrmJkDCxV93MeYB77RGQP0e96Xo3rIAe29U1vRHWWW5PvHynmU1ElTAZrDVgpNIlqiwoKxCrCceAbo77Md8076w7QWZ14Qaccfd1wlNRe7zgRfkLBlFyC0aPtL3b0Mtm44ey10zk9lDU9ulbFQNFwjiJig44gzMM2ENKQ/koYXQC28BNTwK37lRgqoySGzHMer0snMMqvb5DVvLLKz9cGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhq2OzzGqlNUfOT613Vchw6U7A4WMC74Ea7d2ZnWYrM=;
 b=fQZNRXr/gSSgcGlij+UG0XAQllMSpLlEpXSS/Vb1uU5gYKqpGhx/5mIITb3iiVKbqCVobhNEVp/PrzrmJni8yJqo5gkgs5OQBSRlYit9yumOs0Ji44GZAGzd/oOLfZ4y2FZCmVsIUTDNzlwe7am3DfSe5I2W9lLxcoyBmJW7EfTvnmZzA0etU6WI9pRJne9kkxj64Ldt1qH92Je4yNix0hOHr0swQGn8Ei3Y9tu9wCMewTT5tl/DgLb/nCI4n9YJWiTKxdBb8ZK8atGAaLkA29VbJCyGN8dDHxKGHT2v15MwTRLcvmDQpPPf/qtVWLWsuiRapB5MCvWJwOqRYsqP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhq2OzzGqlNUfOT613Vchw6U7A4WMC74Ea7d2ZnWYrM=;
 b=Gd6XBieFJl3UrQXha4wLjsqttExet9kbOClQ6zCvi6aERNziEdOU+TsIE5651dpg6XFq0j418fieZeGEoJ+o9EUZyX4fTCF1f1Uq2BTf6ftA2JchySOVtYQfjOQpVh5nPER8a0TigM8mOlVfzRAyrmuhqqqen2xuAv6osrzO1/I=
Received: from CY4PR07MB2757.namprd07.prod.outlook.com (2603:10b6:903:22::20)
 by CY4PR07MB3175.namprd07.prod.outlook.com (2603:10b6:903:cf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 7 May
 2021 05:40:50 +0000
Received: from CY4PR07MB2757.namprd07.prod.outlook.com
 ([fe80::4096:aaf6:cdb7:ba46]) by CY4PR07MB2757.namprd07.prod.outlook.com
 ([fe80::4096:aaf6:cdb7:ba46%9]) with mapi id 15.20.4108.026; Fri, 7 May 2021
 05:40:50 +0000
From: Parshuram Raju Thombare <pthombar@cadence.com>
To: Parshuram Raju Thombare <pthombar@cadence.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] linux-firmware: update firmware for mhdp8546
Thread-Topic: [PATCH] linux-firmware: update firmware for mhdp8546
Thread-Index: AQHXQwHoF8Rq3pY8GUupgot5DzXhKqrXgPyg
Date: Fri, 7 May 2021 05:40:50 +0000
Message-ID: <CY4PR07MB275706A8862536D85A71C7BCC1579@CY4PR07MB2757.namprd07.prod.outlook.com>
References: <1620365312-21134-1-git-send-email-pthombar@cadence.com>
In-Reply-To: <1620365312-21134-1-git-send-email-pthombar@cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccHRob21iYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jNGFkYmU1NC1hZWY2LTExZWItODYzMS0wMGUwNGIzNmI1YjFcYW1lLXRlc3RcYzRhZGJlNTYtYWVmNi0xMWViLTg2MzEtMDBlMDRiMzZiNWIxYm9keS50eHQiIHN6PSIzMzQ5OCIgdD0iMTMyNjQ4Mzk2NDU5OTcwMzg3IiBoPSJBU1hGOGF1S09obThoSzNuMkU5YTRDaTBoUkk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09a67bcc-d997-491a-4d04-08d9111aac51
x-ms-traffictypediagnostic: CY4PR07MB3175:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR07MB3175D3F087756F241A234E70C1579@CY4PR07MB3175.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4t20IRhPlhQwDZZqxXmdefXUeMOlbeTHMzy4oS+Ge+mYEX6Zwi8ulSUFBZneBS7ABhSIbNfQneCchyr8CfOHsBOWIlJ73hBOAHHIs16uMKEU48ceqzDtOyrW2Hhs1B1uDgkFEg4PljDBGWDmLcPIDGBLUuquZydkGg8MbZsV4vo91ZQzqBULfnP4MjfioOKxS3DJm64DHopJ/jUJWXFJ8lQ0LP2UKUmS9WfO53CCjYv/OLnEtjHLQ9vmzpTJJO1elpEkSizFlhJt2Em+60RDzF1f44KiAzPzRGuYtwSVnLqA/oQ2411O3aSglMfrzz4F/+7wP/ETC9OsGyO4RHBglVc/qHVOYL2o+YuDz+rWK33KrK46o2WwJt0EGF0hWq6MgBQeDozUitzXUF3Qzyqv3dDG23MIQ59x/R/O8rfPyfAFwLHGFyH+oyCp68cEHiuQ+5QaqG0DkV9HNJgC/dhnqB4K/A8U+QiyBr9lYZQ1FNEWZzRaakHnqnLz/wg045pF69H10/R652oBoiaG2VUxo0x4+V+Ov7YQzRusoFugiFjYog6VpN3PM+4CjJYHbjX3pmV1hmgwqMu7tE8kvmTXSvodkt4JdJWZJ0aTEbAzwJvAtVMwu4rWbLUswE/y4wQSGPW7dvU/keA5gqRrsRcXYubSOkcAC5BtjGPpVmY63Yk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR07MB2757.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(36092001)(86362001)(186003)(26005)(6506007)(9686003)(54906003)(2906002)(83380400001)(122000001)(71200400001)(33656002)(8676002)(38100700002)(66946007)(8936002)(15650500001)(76116006)(52536014)(66446008)(64756008)(66556008)(478600001)(66476007)(7696005)(4326008)(55016002)(5660300002)(110136005)(30864003)(316002)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?k19QljHNd8X8wSxM3FnLlVwIhMP/sQfT2Jw5xN6O4gS3AyyeFv3FjTvpfaFZ?=
 =?us-ascii?Q?x0DoZPTDKZWCOYfimB5F85ZOc5dHwvT1is6xCiwO8nrKytRJDXT1SW8Micz/?=
 =?us-ascii?Q?dSNUp3hOCVDCtfiGSV8PTQZJIH1xJKl7suoM0HTSQqohSeiTxnzi2xctEnrV?=
 =?us-ascii?Q?fUtglPvLUWutNDJrRD5Bi5CKN3SBOsgO2rvjGNeJbH9qZVLVd5zrlH0VPyve?=
 =?us-ascii?Q?6Svuy7F0verapNs2Vozt7At3vwHSIClaRh61Vix+Ss+zWSiHgbbKhZjAowBg?=
 =?us-ascii?Q?ndzjvp9jP6gHObZc41ce+CkKjDvHzazpWqO4TkEJASnjs7oLuGTK1TOv9P5d?=
 =?us-ascii?Q?Lla8N5kNXsQpuovDMPllOLEgsBASSi+HA3OQ95iHHuVd2/7ytJtmh90PU62O?=
 =?us-ascii?Q?asiY9p25j685FYN/o4TBqVEbO05wOfY033Lp1XlmVimvC6eexw4doEklAToM?=
 =?us-ascii?Q?0ulm+wbQP6pzcWr2FRDMjlNb25cw9fV+AX37/lIy8pbOvTebT/P6XzeQxUkh?=
 =?us-ascii?Q?QMA0r/KPoSqr9dPbgB1hgtgLNrVRL0EaDoT82gsHiQ/O2OBO1lWuIJUPsnwj?=
 =?us-ascii?Q?C/cEXqYZa6jhIQok5qUEQVz71oLA46snI+xUkWURfqohJQC42IRZsFZtwUVL?=
 =?us-ascii?Q?o0NSdYhUD4yedq43iIn/l+uSxyaZ8cJcPiSv89jRciAG2WQifxZ+I8QSbjpl?=
 =?us-ascii?Q?ABfyfDL8MMxzpksnZfDw/FdUXAjWKMwztCEgecbpLBjK7j6q44B4nzAmvzaV?=
 =?us-ascii?Q?iquzoi22dHjIGfi86N9MB+80RY1d2TOKpXfweGDW7y1efrcfiaHKad8QgzVR?=
 =?us-ascii?Q?x50scyn7ry0UZmeJQhMwQFnSIrozyip28DJQwNkLq24lfuKR8VirEBW0jQVT?=
 =?us-ascii?Q?AZFCujJ1Na1SKDUThRH3cEZWa70EsqW2G/fRZ9LWrEBxLFjmcUMW/v8ok71Q?=
 =?us-ascii?Q?lxij1yGjdIIBXk81P/puHpVzocGX3k/s57CIJohHKODDn58oWxUnlQXAYsPW?=
 =?us-ascii?Q?srlmoMQr6xB9eKXVGeG4h/Dy/V2uH0Pe21AlUu9143BsoW6bA2fjPhXpy6Y/?=
 =?us-ascii?Q?bla4DFyOpF7ju813t3hCIi/pVmPmtnpUlKaqvDuXskLVUuhdoAgIIximbF1g?=
 =?us-ascii?Q?XufxIUIWbpoSpJtWW4Wzcgr00JcybUKS2M3YCeX6nuzwAChaoxvhgAqkLGMK?=
 =?us-ascii?Q?cljsCLZ47NaFJY5fPSVjTGadGZtjfYS/j3PS6WSXgXvjLtyadnJvWY/g++em?=
 =?us-ascii?Q?iBKhZ51KvDd2hEcMq5JCupmVmMKx94Y6D5XmhdLNgrZJMegQYCShNd4J8mB2?=
 =?us-ascii?Q?S3BzBmzViiHot2R9YFFCT9ep?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR07MB2757.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a67bcc-d997-491a-4d04-08d9111aac51
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 05:40:50.5427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIDzBySjZTEqIpMR1okfshgGs07deFRHPyWMv3xF67w1ajF22a69CJiKFWgPuuHCsLIl4FKnapF/akXirSGvFFhEYEpkcxRwz0Gf24Sj6eA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3175
X-Proofpoint-GUID: M9TdUWV2dkJghcNWaudn0qeUkZ1xi1qs
X-Proofpoint-ORIG-GUID: M9TdUWV2dkJghcNWaudn0qeUkZ1xi1qs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_01:2021-05-06,
 2021-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105070042
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
Cc: Milind Parab <mparab@cadence.com>, "kishon@ti.com" <kishon@ti.com>,
 "nikhil.nd@ti.com" <nikhil.nd@ti.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please ignore this patch.

Regards,
Parshuram Thombare

>-----Original Message-----
>From: Parshuram Thombare <pthombar@cadence.com>
>Sent: Friday, May 7, 2021 10:59 AM
>To: linux-firmware@kernel.org; dri-devel@lists.freedesktop.org
>Cc: Swapnil Kashinath Jakhade <sjakhade@cadence.com>; Milind Parab
><mparab@cadence.com>; kishon@ti.com; nikhil.nd@ti.com; Parshuram Raju
>Thombare <pthombar@cadence.com>
>Subject: [PATCH] linux-firmware: update firmware for mhdp8546
>
>This patch updates mhdp8546 firmware to 2.1.0
>
>Fix memory leak in HDCP state machine.
>
>Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
>---
> WHENCE               |   10 ++++++++++
> cadence/mhdp8546.bin |  Bin 131072 -> 131072 bytes
> 2 files changed, 10 insertions(+), 0 deletions(-)
>
>diff --git a/WHENCE b/WHENCE
>index 440f8cd..178ddcc 100644
>--- a/WHENCE
>+++ b/WHENCE
>@@ -8,6 +8,16 @@ kernel.
>
> -------------------------------------------------------------------------=
-
>
>+Driver: cdns-mhdp - Cadence MHDP8546 DP bridge
>+
>+File: cadence/mhdp8546.bin
>+Version: 2.1.0
>+Info: Updated to version 2.1.0
>+
>+Licence: Redistributable. See LICENCE.cadence for details
>+
>+-------------------------------------------------------------------------=
-
>+
> Driver: BCM-0bb4-0306 Cypress Bluetooth firmware for HTC Vive
>
> File: brcm/BCM-0bb4-0306.hcd
>diff --git a/cadence/mhdp8546.bin b/cadence/mhdp8546.bin
>index
>2f85f57c506e3347c1f4670b9a0b96e415d2eaaa..bbb1009a22ac01d6a28c09d8ac
>d2ae73b820bb9f 100755
>GIT binary patch
>delta 14381
>zcmcJ0d011|_UJh$VG3Ji7D&J(5I{tmpmnwgDl(~nLlw0ZFbGanOK+`JGw8KwX)np{
>zy^5u6PTJh6mHte$Ep4SGskIK+D|Aw8?*-Zjk^l))KnUlp6ZGCUe82bpdilPcb@sH@
>z+H0@9_F8+Nqg47TmA+M{eZFM~__Y}6b|3HkfrNDNi}+37L~msPAzk<<{FQHh)Y5P
>!
>zr7ng^SscNnv_QH&jY-)FWj_Ke#Z&#B3Tg=3D>q_Lq)%BgTd8Zenj5lqJ0{h~#uA|M;a
>zq$GtfDfSpbdKsErgTw&Ig?vI<j?en>Nge*yZ+WcLn@P!u1tMZ-1H=3DLZOiClbtpNai
>znH1k7LW-rl@<8rlg6Nn=3DNb8mY0!Y`ekrzCVfRbE4AO+3#Ksr-M5CSNR(s~nH0G0yT
>z{w0KT6R_gI-h^)zltY;gyLs`{tm!z;KRWXRDIu+yK}ZQmccAhpz<_vy@P#ojz;r+4
>z7d{1~{Rv_&w5<pxh@$}Cddr(wJb^=3D$0`eTlci=3Dbt<L6xoW>Tv7ObW_{){w%XRv;s!
>zIRNj&XfGubQo+-NbmuHW>I?8NP)UWlE!gSL54{8>*JcyaEprHIh7Xfc4)8J-p~+s-
>zNDwqmMcG+97ZFmFMo9ai?&}~Xr3RkwKq3Isr9dX70S3Gn#!-
>_C5HR<EEN5jB(u8G%
>zG(_o5*g<@CP@l03|BU7ryalswhm-_W-q3w9#iV=3DyO&gaJ(nKiRpFv3H0-8$zJN%gx
>zqKuGox5I#7a7!Wi0{S1Jt`SIhLHnHmJE4ro!n-HTp0F^BkY0kxtAlg}8z;o1U&tn;
>z3!q_R4#;u^Aw3U?fV}P)Nd&AUq(1PR3osX?wI37?LB0a=3DXI8-&;29(<&B(=3D(6Qd_o
>z<Pp-UDIi$T&kVe5;xt800&p1%LW~ClMTGPNNF9(aJqr^C=3D{BVGFg+J|Ov>m6Li*z*
>zCIz%cS_k=3DCh)Jo0vKDC50_DDt4*>1D0I+c)K%kThBg=3DriGMpgRtOvY+>ps-2f%1ij
>z2~KH&!rNOw9MI?{i=3DYrwlf;TOK;tsd_z~JxL2=3D9TFv-yD6r{P3UkLCzz#EXxz;hCy
>zIS=3Din2?Q|<QUW9bk^s^spcM|#UJUIZg~0P4>_P%aKz}8a-QP+`!{M0=3DDVAasDN>l$
>zgMcst8s$QR0H_#(>AYM@NTo2HTi66s`(q}PQcz$pT-fVRbO6$$AdIb$egvue#sC8%
>zm~z1J76_SuXD%ed59mVTh7i&#!O#{`2MDGgU}+GP@v%5yh64Qwx=3DbLTmlyOQ8
>e$>u
>zLl8<fr(6L`;6<2CNC$z{{ahwxE@<U!6`>->7CBmc2^BF8qa4s45hAxc(CrS(CmJY%
>z(h;%|_acY%L2!VONPPs4l}m4P+44e{d+(6@<xiKT`nlYdR|@;xd;9U7fQ5>+E4&LI
>zxc5GAmwKxnxHS*l^aFQjuUBEKdv7aS*6I%Z%Il|Iui2@DtktdN5cVNai@T1}Pb0$a
>z5!r87Q!PBAjymJNE|Q^tbtC`JB7Nz5Zq*$(@QMVMB}9~iWfl6XesXJd#K~}fy4h{~
>z!L4e7CR3o=3DQ%T=3D;TfZeY^Njy+)BkYGuaJm~IP~|J42qj7H<SFOix-!dTxz5(Zpl~V
>zhhBq^yXk2{-axM4Aunis8Cu6rx=3Dixd=3DH`}{e9}l?a7#YNbAr}Rc-yUd+bzs3SFUYR
>zoyOHcwSqlv*<N?vPPcGzdG6AtydCcOvkKOnSgPeJ3(Ig(@Bzh2w=3DBnvsASG9<xE|2
>zi~@zLmqbln;t@M5jO9=3D%E*6QGD5D%~KIMPSPxtbF>AZw~#;tvyQAa9@A`kn&%r
>Dup
>z<*nD|`S2^0%6@f$qQs}OsNgVQWcxquMqDvRSvbpme_uY`5P~M}TcX@@v}#|5a
>$kmu
>z9e@9`I3<Kn#^H@2W!wpF5rwaX?3&a*YIctH(hVpo&oSESz)M3HkS$ml`s~EU(F|^#
>zS2cNtLX_qPwua7~B&O<lwLX$zM&N%Y-
>YUXLVU<3A8<m|L&HF3<I&2R2_^9~=3DeiSyJ
>z`|@b&t9b6@<s`z&$*bqC9j*0g_)>Sv+Zs=3Dx3C&B%=3DA}gQQmTzo?#&(z``8;rnz$S*
>zmpU6*6u+pKOXkNf44cFiWnlmC2#TU`TzEV=3D53dZ5jhr@`DjgMjDbr#V;%3rcEEJa4
>zQ<70q6^JXtBg6ctMLeSrs98a4v9LOD-BjPgP<%Oj+VnwEr!0T%;tJK!i1fv(I#T(v
>z?iJC#Ujp`h7Xr;W)O22*sMg2yYryMY8Xn=3D02$8_)=3D`quo5I8<-g~V^%Tbx=3DdLI!fm
>zi<t71eS~(7sC|{Pha;aRM4Mt3Sz;Jb_sCgJv!$b!l8-R;ls;ymyqBELi*nE%_`Qg~
>zPPsB-_?4u;8IgGYt@lXUG9vf<OYV^xGhQ8elCsXj_Q-
>@4>JgD<Bu%oYma6AU0w|e!
>zBrb76JypxO#kEqzbe=3DawusO*cz<)pa7PppTJT%fQVcKqXSRIV&$jEW8amH0dp$ZrB
>zqk<2NSmG6<sFsWTP3i517BcT;tl>{4|Ao);<2P>}F?>%h;+ec30P|Z3-ArLE1#GJ0
>zrlJVl@gv8nV?4s}JF{+JxRx^9B})=3Dx?V-RMb&G3=3DAU5-$(;f2aFq5x)F@2ChoXs3-
>z3v;!PVc9n@c)B1W!s;f|hnQLp6x?G<5>Z&PKh$!p-{R*5p^>vj>N%Tvk}Kp{QkFbY
>z595)4L$)T5G|j_r3L+KP$+IFfjgB9Yz>^FupyNgi*T_4vYognY!iICgb&t5Tcm(-d
>zBZ+lc&{=3DYk6pRUabhnq9qeiZ$Hs>7vB_;OuR}HmZrkukUE|g0Of$6%`T8_#8uzU-l
>zTPwUu5r~)m69d*@0yMAn%9}h=3D5$FsZLD9xQ93LggAAKZqKC1P%#JnqSVW#ucx))
>!I
>z^wM~bXp0N~y|VirA$~2#5CAiTxOvt`gFjBbpJtN03xxQT^;trgDD;>k?_owY{0P4r
>z6*JGUim2m!4k{SsSg!R(ycL{d9Ab`^i+He`vl24YlIy;3!@LQuQ`Qioo~O@)a>FJ3
>zC@NEESWYbBdjFFFljjw-
>b`0@MLDXlnP%Xv3bm2n3<YQbMEg?U`$D`c}`Ah;uRC@^B
>zf?0qmONKq?>LUiU2gt}}#3@d?i}h;3rc}PjYC8zD0Q6`!P1KTTGV(6Uqsm0Dko7*2
>zlVESxb^6wGDnvKwOy5^zuM`&L`IhAs<xMP887e`Q>PfvhTvAEuRtwh|yl&D@$@`c
>^
>zz<UrB8+sXiUhuh#z#_2mF5ntHksKI&er8%=3DP+i_N@f}qy7bgpo1lIj57Q=3DqBmXz-&
>zr+ajIb|I0v^bwtg_Y3Ecv+)ICI4Qx`g)w9T?h*<_0gw2<-TeI_dDlCgB5FBxr2GO|
>z5;?~dI;xi_TD}aF;6zcJzu^H)Vc5Nq!jWOTQ8Yy&`2+Iz3od*X2+9)<)7N;q)~nv@
>z7RPWOD%PpFwO(=3DseorKhl)u0(xpSVDhG4d3C)*C{@vkB&`58vySki!H;w_Y9BgW!+
>z>kRuq-
>?@S!cFl5YN$X}7fqqUXNUzq*x(RZPmNKteQgVg4CaDw2XEU{=3DVI}#*@W5QJ
>zB2~KK`R6{IJIQoo%7srrXx2h3j!|b=3DGf8z2#b26xT3F55?43RHwOMyrlLa%Fw{uvw
>zWw<ExaDM3iTF#cW4Y|4f7vzEU-
>qv0iQR@0(pw2ZMAzRi4?%j^<F``*2^4K8LxUb$D
>z79XqO^mD`dZQGydHo75yz+p3h8wrdXhUxXgnhiKLHa;PDxIsvq@<Ve^`cl>rMix1o
>znlTIuDNK~b)+A7qi-J&=3D!4Fr(hRl=3Dra-^qq+Np}7rH6_#qc&s$PC%*h8<zPD|M#0_
>z-qZNE*lF{o4I_WU*94siPy%o&oBxWS6WBb!cs5^8&~a?O-s2&#*i(PUsS;tV98{W8
>z-5mm^rY2Y!%KYn)@!pUoblBv7OYe6GwkdNk{<9<|?imi^hTZd$`3=3D*4!)F7v9JQKr
>zL|Gk}%uyz%5>*vKbsnkt3V$z|7B@VE{BKe6LD(MZDa1pEtZ^I^iC&e=3D<;ePm3j2mc
>zeM5PDcuL&N=3Dvkbw1HoD^W#i}d-t-
>?s0whsW$1({2>+9|Z7Pem86ZaIU_}h@^$dK0m
>zkXkoVMRViJc*^Pk@P*P8+U!G@6PtDJ+jj$+vk#p=3DfFdP#8E+0Dzs*!`*NcUfk>E|W
>zQ3or(((7~re`_p(CiSKrjB*%$ga+t<<Y(rXi&4!P(##oB``)Um(5Vv?6{RH!^{7++
>zBXi6FD}Q#Xf>6CYq<MLWE`nj1vJRTE6x!`V)B3~oi$jKgdt9k|hbn?lu-cbMUaC+k
>zx$33hih!8aL8NB;5Q@}iD%6>W&->D)LkU3ww9#bULeV8dCQGOQ$+u7@i-
>azQ;TxW(
>z#wVXH9Fi3d84HIjieQEOIm#5Quz)>|M28HcY?E;}Z~c(5U<hrJZ=3D&c8L&gm(f{hdn
>zrR<}%!1K7Cm1+Uy>Ai3x^dI_9|BNAH9@~HYcr}7*>mXDE<KxseYO<t5=3D#ctut2+F!
>zI#Z>rNL6Pl4gHU~tP2t?8A6q?F|MINkzThFgk~|$nK~<K)(|Wv%DRdz-Y6esHeRHq
>zLl!#Ru#(aw;diF;6=3D6g56pTHGLZPXWA^Y$8D@mv_*%DCCkz`Y}2)KS-Tu;ffz!1|@
>zfQTUzHdi_do+O!6{?dc_OAkGf!<is3%a0fj-*gxV*g`AoDMLC%hYX>Gre?}?Q)yjB
>zX#$6kFR<@vrvQzg=3DaB>q7R|2<La|zZLdF}astReG2fF}=3DD2d>rh^r)FxjxqL!I5`(
>z+T!TAdC#@^6Er#0@;kS!cuKQBfnLA;Be!{p8tC`NM8{1DpdYyqU-ihPE*2Sv8E+pV
>ztvJ@`a?viA#^ur$i}b}YreZN&>~O)lbTQY0EQpA=3D`^wKzP2anki$&w3IP5y}MdN9e
>z-
>32NMzJHVhRGA$vFe|rnE+0U_qAM=3Di>e5n5wfLK=3DDy}w53GL`VTurSmW2>u8{H=3DKx
>z?n;b|kaTduwsYybF7ppAHSaK*I=3DM7d^NY*)3l>fb<zI7^%<$K4ztX$iqPgliHpHkb
>zz?XWvnQp|n)21vlv~p@9QDhR|T;r1b#?c&isTy4BGQ|_o8~(+qNksFFmtAJ;vfkrp
>zR4&yQPZ|KTc@-{|0biOXO#CmGUi^&eV^?Js4CNR>sEeLyJ>b#@DNWIbd-
>YRvZ%a>3
>z3Uk~D&|o|^Ez;*b7hUKw?!!}(_#xXsqLO0P`~ybGkDSXVnlN6OBvica((8`E3~6_%
>zfQREQ?R52x>yj&Al#Q>s^!}q3zG7YE*z0!wqu%UM`iQG-qe2f&PZ(9M^nM2ZlX%B^
>z7^4!<DAT(b<6##%k#1v*hg^aa=3D?@v>L6?A+-u~DDu-
>@RDKhe6|rJbQ@o^dEHVoI}O
>zw<<1kb=3D-#aaj$HSt1dF`1AGXnXQ*#nle0`XOI&(APdjPUGDXptY24xRD3y<KJCN}v
>z3FEUaG=3DFd^YTD*Hm&8A=3DUNtIyUeUZ;b+wx@76YnuJ7X+jIp}1Jg>1fqF>V1?FL*y-
>zSV=3DVCozoXiS>;OdzeS2xx>D!3#9~EqY>Iq7DNYrkP0ePh<~sgvdc49=3DN}f-opK+Pq
>z?~ue3y|H<MiOnHO^8%M;>oYCC3HeO#*1YC5urRc-d8*ki_10(j)!MCj;{vyS!l^us
>zZWv`Qi*Bp+$u10fc!~1{kDl%do6FUN!3>ELpSC2%sA62LQ(fq5@ENm?HWw`E-7ajy
>zyJp1YPj-2`8Q|LbG3W9ZqJIn`j+#<vsl(?x&S%nNgXRF2G0=3DtHY2G2U?1)azKC0g#
>zPTshLp2#w7jUYf?C{Z$vOip8U4?=3DjEAGXd|Og$RJ@lUN*Si4BrLGBLzMsEDJp`l;$
>z9I^3(dJ^o*N{DAKpN3Gz8~`~RdHzS(k#bD5<AN!`x{$m@p(x#ja>H5@_6U<sX-y=3D}
>z&4ZTWuqX#QZQz5>p#ljDSb-Z(b1F}ubH<y42w7)BA(R=3DfLq?-`dk}?d{gk!7Ro9Nl
>zkCXJ(!PZX)jR}M1ghALzo6Li-lbWW%>?+P?k0VpPIS9eheP6)|<c|cBV<dfUQ1jP8
>z?RL-jKu(xbQy@P<qDak~gT{-4>IkK&>=3D_+wv>RZe#y5b%z`;EK!PJR^>+-#3rEzcN
>z#^5bWbr20sUHX{gzi`-n(fGljNIR&)gIci?42n9Fu!xlg6^DLr5TpyC8IaHxJtmy@
>z_MqtP!8D0V_BQ@rx`M300@-
>xQ4+HW?%!k}T`qe=3D&Yx*S|T}7&{YCu=3D_l4%K{T|%mt
>zQ1qYhZds&Y&!Bt|8u;s!1G=3DG9-Km$fOMH8m@YGBE=3D<WCenUE~T-
>^yahjrbw_uf`LS
>zW5{eQOHQ0^-
>Ny+#9a%UukSZD!$7z$V?pJ%Wp>5+G{nb*~zrQAHIp}pc0Ln0%Fh4zr
>z{PG(YV@>kR9LeV-@@tA4tS7&?&L6&aw%}pgM5UgmbX1kMoRjKvh?38(0-
>p6>3<?r{
>zA*7=3DQ<^N=3Doc-DV1Y%X%p@Eb!%41#|I@Le1*Glu*do(2DJ;`Q)<3?GF5!&o<SDz|fh
>zF2}cK#w`DMz}Yf@Dq770$WOcSsP?%f>fOTL-
>O<gv#pAPMCgjg@!fyBo4!KFhOT9fH
>zyD-ppMJSF@KDyEQg~?xO${{|i$8%;yDXtHo%4V}r5(p8j-YiT)5|Tu4xIkYSIKNTz
>z&49Ro&=3DxDe&cOrPF27Bfc>_)U0~U1acB9Ucq?o!h%3+Emn%`$WTlA}@Zh&uVD<
>F>b
>zva8Lof>qfA#!Ca>5Ile_1j^(&U_nLC4<w7VYDy`#L`fUhdv@<?l8vBIrTiqR+A~0(
>z89+NUN3dhoWQ8OH95pVzctG?LATo)SR!q|K28`*zxf~u(4;W9wqd`m3PY)QASYjHI
>zermw@^Z?o<(Xfjv$6wM+sNNV*KhZO58p~RN@eQ`geU`OW2x^Qc1}wU3@`s##
><_zSw
>zsj-V(xT6RkdwROUx|68)sU>rebvtp33+@Fe-wsh&y_dBV02G3o4z-dpPhk=3D=3DloIu9
>z46zMRdkn_J0X64vBVet*Sp5x9ngASIkCLy`#zJ-&M<K8ZF!uHLat=3D3>lLW}|o3uG~
>zl2r|}hmN;y3LR)R2i&{f`KWi2(u4^9Iev9jRXJWhJ3(QPf#Uj#vIkQ6Ak-<fT<ai1
>zXAT$!A#5?)`T_SrmddgLw9xu0`6X>!3Qv+($y#nbiR^&ZU}NezKs^are<d!TR#O$`
>zSNm(~Pz3#;A0g0VlkS@C`Vo{R5s;eM1KOhKC`VIyKPZ4EZs4}UqXfwR^PLbxLsW5w
>z9k9n$kR-4o&N3zrpo4Pr`0R@=3D^p6|f%Ngg7qi8_?eg~kJ2?m@u`<poxFudDeV8{1I
>zP@+7PR0#&u#nI!&_k9SCwI1`!8bf;WfbpY#w8^^r84{wOoPNa9yxWiVt2Ze0*>fz}
>zv&Rjp{9~f^=3Dl-S%17P~bZIU&bQ*%yb>8Je$&;rd*{n$Ax7=3DJYfMgQPN;Xomusumyj
>zcxEgaSnK=3D7k~oFyamSntG9An2?weXNwgS#q;Ml|)&MfYCo)JTce~ojUVq@8zW0g
>Oi
>z5!c1ETnV(U$BlFI$OAZf-egIwdl#=3DU5m}-fpfJT_b+I*kO9)l#-O?Bc`-ME0JQFMV
>z0vF7SRmkHZgnc5x)VqD`ahy`#!PFd(-RVQ@5mOt(7vG%eDYrggK1{aJ&3%RzhQ84U
>zQ6l|oAJ`eT<X?<N*$*D4$6JD-upY6Yk7+D`#pZ8FAM;Rw@|s!5fBuzPj+zHr)rg1Z
>zA#xw~p06h}@Y(q>QF0p-<*?{p{4R*HcETf~)=3D^{h;XYF+WuA{8&KD?v_E}NA7hTjR
>zzt7Ope#<>h(RM}iJxaWp5N}uAJonw{Zu-T(I#Tja(6h6$)`WigU|-R0g?P8B?VptR
>zIdG~Nko}~yftsy-XE@Dwy>vrIdRH8*oKjSFaxUnp^?Sy=3DxzBXpYv0ay^w~#YBtG)H
>zOg&e&zHfgZKDr=3DiQeeOJ8k1lA?kSn@HDT){Y*-LC*>IP!+!za6*j*zzC8>OP$IoXM
>zuhvU~+ZId@lKkvu#}6^Wj4?PZ;}~XO(ZX0H|BSh*mwd+PE#U^7w@?}>4`jd){?aE2
>zV36-|>Ua>?3HI>C_yc}>p@J*xlU>5mi$u}#U{dr^U+YJGTF%zy?}zO3(smyb?^d7%
>z=3DCggy5Ao(j5u_f!yl5kwjQp@j#(TBT^fQD7qlJg@#Ao6JR+4Py$lI>G(ee{+ULwE0
>zCVxpy{_0iEus+phocoN8JF`zU6Q`tPks^Eo?meuki<eWDk>nLjrEVe5<KomfskNOz
>zzUDQ(nyXIwJEzv~mT^(9u9}VOO*<9G%UF$q$rg<`S<mNC>M8trsvvSwuSs{}7T4-x
>z(0p@PZ&PS*>tA}EZ}b{p$33Z2VC$Kb79%^{+g3E=3DiAKsEIFYxQqX1i0W64|F+t`u%
>zaxaR|E~`kBM;9%DMV4BQi_>BhC!Dfny_yQA{+pM?F@FbsAP~Ck;pd|-kC$1$An3)t
>zkE5d?3FLluLbSd~{y9Of?A>UxfG<=3D>&^ewar0M3Lt)CI}`d*Y|YKB~e1ad2TA<pt-
>zPe?u`L{=3DwCv~U!N-_XEq_yS|ECE=3D?wfb(ZOn~tjAiM;YNj^?jlA}$psmqypTg~BwO
>zoW@P8sK5qY@UW))z<hQ?SsDGCQ(yXcBL$bghyo8Z()cvqxnx?9Jd!j#M}<ZDplK*6
>zFQHdP<FiZn3dt2h9J61`2`{X6Hg2f(hG_IGyCqPlvNf_7O;1~?N?WOJUa6G-op@bu
>z>~?}NHV|n`BGcqyY0EaHt$oV*p;HymtColK%ELW8izfE!#fwxEdjAu%ENU%v>VuB_
>z?=3Dg$YiJ58Pp=3Dg?_(5V@7(xXm&*&%hAnl5lk@Sdd-MXyuzlT(nR7mMX?rt*ZQ$Ehuf
>zVlQ*FROP3c-l)KO9?UZY0cn+*hfePy&(Q;6$fjx%1zDn2r|}P`MXa`_Q>x#c>LO3%
>z3(BNf;8go5^nQnH)>n2SzWK7V>8`VRXOt<Y66{2x;X}{X2bL#<+S}@o7VEZb=3D}%rh
>zTmRkMTi#YJPFN=3DNx#2WXM>XH#Rm&p0<mrUQf_E(opKLfhR!1G;3GO4F_0U*d&
>@LWY
>zh$7{<W?2gPA-=3DyXX2E+-$)Co~rqb^^4KIzI&7<FON&ptpHBLkM*x9}G+fE5U6@A)i
>zcya8khOTx>0Mhg+rvcATe`?0_PKep}j=3D@d938!`U*jY1u+$jgxL{~ViyT;D8(yuw?
>z0G;$Pr*$VjnJx{K>>2}8@GpmT#~A&a1NqDGo%AWbyPf_&SNIq1!c2M`W!;D4mo
>MU5
>zcR$_&TM4;{3hVR}J>%3<N6&v@T!|ISlgOp`{BoI}d>etlK`_q250;A*p-wbG@(a^C
>z-Pu+&<?&)Qgi+^D7(<-;X|Wa_spSz$*e$As+KuTiKMeltVF1J^O=3D4$N%htB+qs=3D>@
>z7dkC}@v+RUK`?hHQ8eZ-MzV7!nMkQ3{-?PUO?IlqO3jd?Bq0!VTVZfOPyy#BL7*A1
>zh_8BrrMv*Ais?yPrW9vLYcLAiOE_r4vCrq0_Wcgs%esB>iYlzGezt5I?c>z=3DI2WHj
>zQeF4NP@o$kR!ZuiBS_EyVMG2AIHS<qb7+eed9<4zbs)as&=3D@@eP!f3v=3D3?Ayko&;
>u
>z@<M)sQqd&`J>bB<XNVLM2byN^B{VkZ4~qL(ZSPr&ShfA!1Zrz_!12Mqagfyc0+eW
>M
>zbs%3&V~@G92UfZ06Gww*m4i5rm&r#+`kq5SuFM|OIKeUQnbg!(4ueSEbeL~DEIX
>p~
>z*_GZ3Px!Zqy)PU0K-
>dod%Mp%%{<w!dpqpdKnr*!5K%4Y8=3D318#<6cPXNDn&H{G7rt
>z%BU_noL@V7OF_mgj^zLPmsA`u{!D-2um%#kikEa31~hdJ-L+Iproxn|goCen`pm=3Dh
>zC5Lqqp}X^v&N0wxazFs2UwK%)Qqj9o*}PKqWaM;3k6{9#Q**=3DWP!dme5-
>YNVi)n{}
>z2lo^?JUJf#{f+~m+{Mt-9rYC4(9owHAX})Yc0j1h{`;`GQw~W4VXp6?|AsZ$Q+y3!
>zg!xSe{TDXFmxO?8B<W!{$4L%(FhL)2NJygfh@)vYUYsqMw4%p4#^{vXu>F20Qnm^
>2
>z$QE-oJ@gCEIfh&0pi5XR3nYF7oew+!b(96bLw2Qug%q9RkoXWy>m1F+tgJk{7ozf3
>zJCcrMFQZrEpqvCU6EDbFm?&=3D|!|w6usqC5@V-N(iVB~<YJv{*F7hqbfql`J(K__E6
>zCq|U$pc5S?&Tfb!Q6kh0u_x=3DnEEhwJS>m9hS=3DJPiLB_<<(xDE+0Nfm+NJBr1l5zl)
>zcQdWsJxw8wai7w|nc-Wq=3D72HKA-
>dj!!a=3D`kebqUH^)pg40Th<CmoV3GfmU;lHuq=3D~
>z)mlG75Pq`GN8|0#Zii|O#{tI^>@cAn@<v{qy+b|t*ovnWl6vxTB>h8=3D=3D))eg$pq`z
>zkAQV_|Fl|sSku{4k`NAuvi_`X{*=3D^o^mu52<&A)4;XTSmU=3DW&~KL=3Dq>TaT)(2SsVl
>zb(_z1vx@=3Du{ChFnEjzx!Y9i@hdmb+b=3Dx6wZthr|#jp!B~2f})>+5k(S!1!Yi&@y~T
>zs+#fYm9r=3DBGY6!Zg@spoiV6eNR~_oYz@n=3DyMl;r}oU%qP9n+ho^`td+4EZe{*748g
>zKGbbFuB*uCn5e5NS9VJuPAbW?Lc|G&BXTj@=3DyM(aZthv#p6j}6=3DnU_6Re8fX=3D~@5
>B
>zjYNSGAr4-(c!J@5@-k0k>Q<S$WsC8aRf5&8_gG@o^0!FMi5_h+h!gk+&(4Q+i1K<g
>z>D}~lcF4vVJ^!aeB!35x8RL7j)6!s4P^3>;bd{Ogx*z{zRqPx?H3>#EQWVi++{F&u
>z`WC6$+4G+bFqv*Ce4!iOMG%J_zOXhhH%+>n6GpGciMcTfezyjM=3DhuUH`XZq|KV4r
>W
>zW<8CxqvM{2I)C}uGV3ry=3DY!Cvcvv>(_8_i)nqoTl{C0MkHw>t9deU|%bf@4QDQ$*Y
>zpK-*Jp=3D!=3DhqDoX-%at5}Nfw0VaeMX-cjYF-dksnGBe*F#L4;*-X~o=3DbbAOlgLV3fN
>zP3Jzc@RZ-pmgL^oHBS$(xn-W))5bf}%Tv=3D`T}md<(Jj1j?%YSWI4u|YTP6^y2VKe|
>z>JzV}l`8n`m41m>|5!0)(|S^;^&o00cPa-Kq=3D#u)LQevRFP{43CaNTeYZwDfj#2Tu
>z!9Z4kD>J@!wR$2ix@XS|gj88B+*0meA`;-;dEfG^N5)UG^4`OX@*`7Eb}37QaF(=3DX
>zrZ9J@F7M}VIDtu)E9S8$O6=3Dl*Yu8%M-
>EMP5m#V&N@r80Y#DWnD1YcAmzB=3D;*!$y26
>ze}=3DzYN0?t?t2OnwDSruNSdGJ0?|@rC_3DkJ75{VfQFtz1GkvjFR}-geaYOm-#-@7e
>z#<^P@{k;hNjab7V2|)%IC81jDJQ%2lG9}>>Y8~@h<ZScuZZye+luhaQ_L?ZF&yIW6
>zgif5>jl7Dym4~SFVX96$4q7`~G1VgjU!T(XbbA*>U3KtE4nPS&HJks;O*`29V`%u)
>zP4}?*$I$SJTQV>@P99~Uh(iBvmD#>{Pr35tCggRXBtKoLrii`u_V`j??ebarbS0c@
>z=3DP#cHw<jXEz2Sm_3(jyDLU*XJdjAcSVH-(%cN@LC!KTq(-9~P=3D1Rl8ECLJU1XJ}40
>zx@qlWXv$Ln4`er($6kgeJO#ZBJhyh+^H&}+JV&ZVx?p-Y#OIeL<Y!!Pj&#vOU7DdT
>zZE2joRMJ}-PoK6+mM$TULtW;<uBQI3y)e#|ZQG{gFRyIgCa`RaGHr|2f44`HM&>Us
>zRXMxZaX+u=3D?$T}x>D?Bl-xjRi77FSqS&S>zO;>#1weVMKJ462igd+#o2oPdl50nGE
>z$>yyP0<-l1ue13-7!*-KHSX7YE33{4K{%c%6`)!}2s@=3D7by97&%S!G4{Vk{LgD!YA
>zNb#R7NcEguw(0-Y;j=3DE$XI+}3c8I(;q^L6wsxuFX+3ujb^o1^cqQY}8=3D*gQu?t=3DFN
>zl2Y}X{%n68ouWVPGM?{3yENyz+Vqt3OjqyDMQvq@<}xL|@NBrkQ1WlCMRZr*dtI
>rs
>z?Xsuss=3Dsx?drkSJip8E+o5Vqi|Ge15?r(B2+4Q$A^@q2$(-Yvdwd%CxLbc^&oy=3DI-
>zMdL1KRhL=3DQg(kMG(6p_nXj^f-ZADevt{BU%$hH@3z$_dZn|2BGyCjB4*W-17!jPXT
>z)Gn<{H6QKT8(^n{@uKzdaR<6oK6VH&j2t^y_Y2icCyv9~G>NB-Ce(~Hm3KK`>}qw}
>z@QL-Jh=3DMM<pi934gfcz}r^KMe*Mf|jv15HaPjVdyfwc1SuxNuYJEx1z>H;>zH<Xnf
>za(2(QP9n|OT^81Aq6uh5TNZJ5ekH%f-y<IASlDPwy<yvuuP#^$#v^VG2f=3DX;nygB}
>z$_;T|qS;-
>DgFo635%jek@r*8;#%)(!wDpP=3DW+VQ2!))&RHY1G#3KUb__B|W%Ubp@J
>zC#KBfrpyY{@=3DDY4H%!alEGml@XC4%}?BZ>LD2MEKTvs6U>anZ3?D)5Wr?`LEo7!-|
>z#&GgFp1P4w{(_fnTr~N-z4fBK?S*kgfGy=3DKyR6=3D>`UY2TjPm=3D^E{Kp_w2Lm{uQ&32
>z&f8@l*;Qw8E7ZJiM}L;lc2za@*^~<B!I_&B0SE1S)9tEP?3(>{`cHOaIli;001mQe
>zZqAmb+LJl#4X{Uk=3D+Aqn+f~{2<ZVjzwj<(gilSf0{Pdyo@57DzRJ(D8onD4N-W(au
>zx5HFCzEcC~r7o}|bS6lZfLk_ioG`(@`1U}d+m;t(S53kh&n1vyc<*yEUZ;(IXmhsP
>znymQzb2FCSw`pl*-d$VjBb&L^RvLtOYHw1kQz{dWh;!6M-b7K3>ijxUzs)39wq2RK
>zaMJ0Y^eZa#EB5!w6>ah(MN8+VUd7SR$4s}{(g((a&(y0nS(`2ID;r#FA4h`1FKnj2
>z6Q&Y{{%6usqSR&$X@11JpAYx>$wnJ(sde~`=3DLKos+r(R=3D^>PRhOk8y@tu)`THR)}e
>zCKl~dw(U|_b{%=3D-7O$!hui7tau)+B^ybr}1cI1l^HF}%uj7@X~+n(nKowSKQw;@3@
>ztxWxkP4kIO^*RpU5<B^@O?24iS<4>NA*-
>^bzG=3D%lhF5P9O+02p3k17TkJx%C!h9U7
>zw<P=3Dh$tKvy<__TcEm7nS{OcCsgd$sRZfyS2isX=3DGd0Vh=3Dp(K92t?E>&cG+Jlg4D~Z
>z(&V5|sXJ}p3y!ah)KxZ=3DGB>$32d^niB$r@CVd#XRhmt6GacKE=3DFIC?|Ocw@6<l5+5
>zn@Oy&d~mqoOSR?wXBxh=3DfV)QL;9G_9K1*!I2wT%+JW?2)yTImoVF_i)hgf%Zj?FN
>_
>z7?!aY`~DIaTQbuI_bjk0cr-|L`l0O9!~fnm=3D1s+AMKM%gCw{XiYvx3ol?@^wPPem|
>zcs4^1pz(-
>GbhlGYohk_rfy#2vG43gF$!QAv7e_3*1$7mJ>mv<M6MCvbGu#PbR9dwu
>z?Uc4Cf`3k*RuScpFCRAvbYG{O^w0p~4m5f?aba<E(r=3Dw`^C(P&!_{%AiA<e{tEQ@D
>zZJj0IscB1yw6tovrBgD>r2Y$kR2)Ix!QU3gk+-qEIO3_Boj_;Y9AE8J(^Xoep(PIo
>zUy0H4Zkdt<{JYIL8k0X^$|*MrA2xlCXKfXdb$IR8Y2?RPwKZ(!*-r4sqa2N=3D8}uQ@
>z4?87nrX+Ey-v12?T{U=3DMhBkW-zq4tyqb>W5){&0p3AdbY;Tv1y;<cTv$2;|YZ#4V;
>z6<PsdV`oS6R6hTPCG!oGXzqZf1l-->$?~VkSMdrscG`hU<@4vtI|V3>+S4qKUA!ga
>zc4M)0RzNMslJ;i3cSA$De8cEw9^y3?YpK7Y@TxOdwz*SxyBy`voA5n3d*3xC596=3Ds
>zv|eV8c@cDWr~EQwqTclXvLuX>ekr8W@lz#|X^T3uzJwtg>KOjg<$vwei}~A^*A;lm
>z=3D-Hjn&iW|>5z#`zJQFKQBK&4_B928Io)?Abl3%I8hxqWeFzVq${I_k1<lnJ*+cfeA
>z+_i1LVq%ACQ-{`H3j2at@bIK>7(JoGJfQ;w-Ed9^n+;rzY_I+j?iPX{YC<12Pf*^j
>zIpRI?M2RF5iJC}}yWPC9Lmw1Ur<MB=3DsxuFdo1V<NTK{T%9akO%s)C~FzIJd=3D9wwp
>*
>z0GhM7d`p86|4|x{efr_eb5{4i4;v)D#N{vOSskK3+SNQI%8oA$F=3DZ*u$sKUKt|!4i
>z*YtE$0|{eGySb$u=3D0jue7{5!UU&bkAkz^AtC=3D+gc1+W?hSgc@ARNu0+D-s&#T3us}
>z^O0XVyxbj8B`klu8mw-nrjs53f{L0_po09&ybf)a0v5**WBjz8-uCb;NMYQ_nD9?!
>zqQJ8(M)4A^M^8^BiwxLjdknb>PlNw-ylVTLiINY;Sl{&Y)TWAdx*5N<eNo8%cF}=3D$
>z<dbF@g)1b!q@U4nA7blv1xaD~4spV8hop<q>$Vz)I^<n2pK!P^zHj)VGNY@*JkUY+
>zb~N>M;Q!hYE3kJQv_afU+d2+Tvvx6bXUD;fY_IvohaI?QN2ua*2mN~oYlG;1utAc|
>z4Bg_%z7OJ3OEx{3MEZUQx+w?M`?UituyP4{N5{gOa;|6VW@RVZ(4Igo{H9V1<5hj
>w
>zF_)9<IVthTBIkxlcNFZ}CSHyW%)q8BlkROevf6aQq&wy%XX6oEvGduYvJMc0I#U4y
>zmOB|3Bkgz~>V1Ix-vPUF(3EyacU=3DcZ;-34nl2@GcnGV_CJJ9sj4?3Lsj@}}5ThY<x
>zqCY1W9g+XUBo`e(b7{ImLw9J4Uey=3D9qAof}zjrZp*C{IPQTyVIm$GKUjys<{DhB2&
>zS8E2^D>%pfU~)5gaC%W0+Tz6yja7=3D!2gvVaxR*mn7&Z~IuJ+XKcFf=3DNEcZ^k=3Dq~=3D#
>zo@w0M?S<cC!=3D5;FwO#XF`}QK(HTPb@zwCMXsn6SmyMhTJ!TK>9_KH4jml`?32Zi
>&<
>zsewV}E$rt3rgrHpp>%20Y%|e%1~1q<hkOUWxHpc};M03!xK-^<Z({Ra(Ii!S!>tP)
>zH9{t!g$ZbV6+8Dnz2L=3Dm;R6nQWdJzGk)`R_>&gK*&Dqo5iJ~0B2f>KSFaQ~;F?jA@
>z*M9<^JP`2Cr@0Il?n`>^`SwgA1KtheEJnd;ZA9uuxQ7VN;HHyci+w3SO87z{`D}Yl
>zF1e<CDlsnrfN&S5fgohL?FpQ@!Ng9E5bzNMxw1X1fzh##thjR8;Y|Ti_C?#i0gC*~
>z#nzX;K7NUerNT4d<BmJq;A5k$@VQV4d_p6K?{*+*jB8F-QDjI`$67-
>A#~PN$@n01@
>zpIHr!^WjqrNI8(gA(g|2HX37yS0g+VCj-67$%-@Z1q<707C;JM<8y?R4RmJ#<N~bR
>zOh~-}>NdfLBLMF}-V5M*$nyZs0yq(10Kh<ix{ZW12w)Y!P=3DKcj2x%BVJLD$=3D^!4%f
>z_JSXG{P&rHL(0fV&o?Dd%R*L&EM&Pse>!=3DCOU5ZeAir}Td?N#pP5bx4r!U_B$v-Lo
>z{{$8PCj9@2!2bjP$!;%lpKMPee8C1u3aJ7<kUBFJzUhIq7*Z^xKcK7u(jG`4JL1k~
>K8gKH2;r{_*Ltf_q
>
>delta 14042
>zcmch8dstIf_UJh$;gxLVDFOjZ0tXPWP4HPCg#apuR-mm_Q7dQ=3Ds9Lc&b*!3))}qoW
>z$!^ETFl|oSOw~$<q_(9hQ<B=3D&2e!i4m$g%1n(_#b1c87&&Rr+i&hNYToBQ9r`M#a
>C
>zpKGtR_S$Q&wa+<fwXa(3TXn|Aiy#StP@9=3D{AMXQ!gsf!`{*!N__mKcXc5g5Khi_hZ
>zY8abR7sIC93ujYq&tg-Gp?nA6Hay$!(V&Z=3Dge-O%o3bN}kOfR<Q=3DFlAmtVAGM>rHi
>z*_5OZHswkTA-
>e)yu0dj1f(Q^1vP@j#Cn9&_>wYU@uK{wIH=3DD95mQ6{OvMB+PY)T{4
>zZ3|#iF3ciijlOIOo+~I{Rtbf58H6kZ(hkUP5wI!02-%dGYHtF+?oGUtNXT;hI4Yq}
>z5+OTVKoAX37p3<m_)u321iX%2f?zTOdkN#I@00K&!sx6_86iu3gpj>6n~;4ET@oN4
>z5Kj=3DkKtBrvpMr7=3Dq&gu%+<TOeRRj}60*rYbrc9l}BZ`4XC)8KsH-zyjK9s6NYzoRD
>zh=3Dq{CpxgkxuLc8$kiQ3<u1h9l4Rc`@NEaX-f|(T1#-B&X!~}2;eLH}Xa;VFKG&cyw
>zK--S_gp9ucr02t?gaO<FNe1oyK<ya7glX*56kiy47S>7@0jq))D0?MZ3ezYE*(vD$
>zDWF=3DCM#%O-B4FB!fo#f_bPxcH%E$o-X!=3D0#r!ooIHBQzb+e(0S(B6@OzeS5S^HT}p
>z6sU?5QW7+K1Bz4%hA#sOR}iv9s0)MP3jx(r09Sz&05#zYXv?82%OYf6(C0SfJ7D<?
>z#UT3<Le>TCm07rS%KRz6K$nX!O&z2ixMoVs@^#sSY%vTfUj+zO6SAiu8IFSPLR}r?
>zeE<#v%mMN40}Vw`mOTOGHH0hy@)rR**Wl2p(Nko(gsf@?oANyfDFZ8}&Qe7t0E
>4k0
>zpm^w1K*%x*VU;1Rdj`0GR1Rq!tZ6MMT=3DjZFcE_Jh$%KA&P`-uOl!Z`t1p2f<{ROCN
>zoC<xRz7}T50j@G3uMPtV033#X7XjBj=3D<^h`EkSH>%9eG6Z1)yWb?9)D8@L5eOqHe
>%
>zK-Cq%cL(}baX6lZMT5G9T!QjFC|?J715zf`-3HvU1cI0gDF8MC-r^q;Rk;=3DL0y7~{
>z`3twr01_}j4D|=3DF&R?|539SK8GYpHd5f<Y%ECx{u3E-V9Hf6&Glc}~$NOZvH1en4X
>z(gDyF-xz|3lmJ_RaT|8|2T$`20j&v!Z3L+Um>dSU1BVC9QC-*z_@)qqgz$ptiH56C
>z_JP&oO6t{Y3h@Gv4(R|W(mp<j1(a*PhR_fbOPwvggoYjWz$hn2JRuny4;&j0%_ABp
>zf-(^D2hb|}H8?;_C`KS#nQ@!X)fWtnm$}DZ{AiiNZ)m*oYQg>SvitZ>z!KH872XB*
>z@iO~(vA4!PuCtFb_VI5VUIi`VWi4D?%lJ1Rd%e-^HD5u<TgJ6KqI+2K^LQO)oJEA*
>zC9?l=3Dnraacb<|nm+6b1pJC1}ONBA;7jBCCd2U=3D02EuDyRa-_m|&7E<*fjAi^WSYj!
>z&EuNe&}9ZRdm5Rq$L*hzn*`>s#+k3imH!|SAMu!5`2E26gv+ETBQ>?W=3Dwc&d9jEK
>a
>zcfE!ljxsWY@)EgPfV`mdW#}9iVETv@J)M(NUi4uj^Y?N313V|_=3D_zN%HD|`fIpyl7
>zn>45K8$mUZ&yUM@kLNx&E>11a$!N+g9bYte!&ApI^n7(eG2R@!f9vXTdG<J>l6l
>wF
>za}3EbDio$okD8h85j!W0<<KbIDv_qEqnup%@&B!yGLHCCp1P1}xVI;F=3D{TCcCtaO$
>zq-sy5dQYZ?<7Z$yelA2r%J3^8CH(2*k|}r~WT$`sSU=3DNXeK3ZiavzMfKES)DEhfA0
>zg=3Dx=3DB{dO#qU*~n2JWC-
>;cLxWCF7%&4)eCBT=3Dn*zjcsAZ1jn{=3D%`WVLK%vkPQ*b%yb
>zkH@U9<GAUI_?j`r%Xr)L6{H`&F#SpLS$$Z<!l%bV-}gol7Cz5TQs)8-<CpgH$-MX_
>zq5gbH-q=3DhMQ8ixmUbnoP<Jle_9ZMMb1QID(66b}*lj(SWSnSGqV~Ry%QZIE{tV-HU
>z3Z-
>Ikc|ApskebLbO9*AyUnRP%e$h}{JMam)=3DevMCUxw89*uANx0(0UR<i<$@7M~7W
>zJJYvd2JQ%(HTynkP?x{*!D<a}O!h)m9SLLqDEWOLLCqG_Noss7KL(t*Y;xn&a7kpZ
>zXT%(HLg3`O6c9i0Z}DoVa5;$XVEBwjhenyvQLV39et-0%glJ35Qd<lw86G{yYqoXN
>zP|8uZo-)QPQTCCu1yN3>AKwgrW5!pbrteAS)+p`yw|_@6jiXA>Km8r4yNOj1Cn<UX
>z4ihB=3DR*p*kGMYv&t)c4qc0|c5ajs}O{S9Edmwby~!!y4!+Dx-;H#_W3R`crUF|SE7
>zHAKM){HiD__{gX&UNwel_(*73-fsGd%+=3Ds}(RA`2{zep^zJ1hmlUypWc>h{M(c1{a
>z95KM}Np0Lr6mB?n_!xCmK$!l`t{ohyp-kVBMTxQ9(|{7{7T*+3Y!U!}-{6$Uu&v55
>z(sE-WG=3DFF<Jv7-)CqsKZABH_3mk+Zwyn4RrE?bm{LX(BigJ-vq-XyWU$Y^+BlfZW4
>z)wNd!>_4*1<D>PwO#<3Vo+IT;MqxZp*+8}~8Es0(mm(vUd_kU*pjnK3l!lxfEoNk+
>zrq9Xm<<}&)8^sOh#cLn%nWRx9v_}wYSHfVrmW-T;>@(cXu*TznsE{f4EkIVCqK0P?
>z9-^^4YPwJ|S`p})F^ZziBK%|&o##C&AAL|Gw8gxsY++{$w1yX6iSW_|jOw=3D*{Jt~C
>zA0SZ;&lEt+79f6Z--Dq$)9<BO=3Dr;kah%!Axh!e#gd*VI9YIvjgMpO)`#Jy1x@;nZR
>zo<^E+Tyz%H?2e8m-@~s()8twFVf46)o<pGU)1ZV=3D&RZZaSc+r<`F-(#g@p!@(Q@Jx
>zZ@C-1I?mQrzQCy=3D5}KZYC7;g_H6#i}UU|9HdPxac?@hl>t`+#z^C~1anJnKDc}YQD
>zuJ8KXyxghlHTGk$=3DJlk}8b%)@4e8>w?|9v0O!sHAO9jT<AgH$Yv&P)u^B=3D&zf+hY7
>zn7^^($$`Na=3DHvwi)#YB3ey^$V!dt{i5%eE8ET+9=3D4WFZ$qpW~Xta-q!#%IL~NCj>Y
>zhXJD_;uvxcj*>)5L=3DQwi-TZea`Gfazim2h$k;)pfC}M$S+L)16wOkHV;ti5Gq5W5o
>zeCXZL0`CX-gk%P-`~}MQHq?F`2um6UQg1xtu^c@6J!n{~<=3D1$b4&bjP(g@QIZfBhL
>z^fU!?J-fid@Sq(Fr84p&ULuVp?YKa?g;K7=3DpGhBEYu^J}$&W1brU(!@N#}D2j0>ju
>z*25@z1C$zVC0;e8@+y0cu9KMNvo)kWoBWO08p^(k)Vw#c=3D=3D{42{Vg|U)P4veqo2i
>j
>zG1^Re1*r|9L>W0}#HV?iytC)LGWQ40j=3D<{WzBnR(ZlrM9p}cAPYIs|oZpg_Qs8t5m
>zdxPj_3lv*NV0OMqO}0E8Shg2O#!BWMB99KSjeF|7VM}m|$&`#3x0n8=3DlIVu=3D-
>#o4W
>zxKX5e+X%CDM7Ir>#l|P(k2HvhQ+{aSNngr7%F5$L6i<%8aTY3hnrlg*rWXdGm9!6T
>zhz)tn<i(SnG3aNi3NsECW<{;f0-S(SGi^j3Jo4Yqs@zmOg`V};{1MoCR|sYvKqbJr
>zT=3D_D=3D%;CxalezLGf{}COOP+(7!>;JVWwbcfejd&pjeQu1nwg*+r>yP6=3D3j?(;t`AR
>zy3y}o!)1dt8h=3DQ~#4Y9_e&}5<dB_M8GIB0Z&(msoht;P8lX>c71yNNY*5;DB8+d}A
>z6~~8}Zc)nnV6*EfBtQr45*~^`FVXXOxf8?kiQ$5YVaWtu6E`PX&I{citoKqkep2tv
>z^bJQMlZrZ;NeHj6y%$)}{edCwQBuVWOa3&h7ar6aMynWpe2GAPIsjadG?hO4;FXol
>zhVk1!1T<$Kyl@6Z&_A%=3DJVJS!tt>T4#g!4@#I#Wd^aexa`;orD;xRwu-=3DB6M%4xa-
>zUC@5|Th`mnGU>zS^kJjmdhL0GF;R84v?%d1>Qdfey`AiQg^Exd9tIih8qQS@=3DM{^k
>znFpkqD(O>)<cB;`0}bHBd0@CA2nB0>iR28GTFuvH9P-p_gGk-pVH9D^QfadeUGQaI
>z7)}U^MEMrwW{N2rw%DdcBKs!FVxyT|z&^c+np}Kl$FO|IuzAO@O%<%N=3DTnwom
>5m}m
>ziU&<@uFIr%wRPC697Y@M>nUd2uz4GY0J2caWtHnZ*{z&ZpP@XXm*m6v`~MmL
><gj@o
>zH~#6#W(3W47c>Jyle6XPo|X-xgW4ZjwPA;}SsHbPLYt*F^*yArE=3DcmkFsg(DCzk@d
>zc*0H)x@>%4=3DG>^1Vc1NRay3_-uN-6ZKVTLQ+n6wV6{TB%Z_N~`B*XO-
>@Sa7XX$skJ
>z_rHx-lTc-{Eufxf%A}Yip!$Tgp0ck1Bg`biBsAnGCIND$<y2nAfxL`^zsccj5UBVA
>z)<ZWV0Rh_>HFzu;6f<KOEwMCHmYZs2I;D#oM!rD4r=3DJQfJ{5$LjDCb9Y}jB3X<UQ^
>zU+{>c2tJDVf+U)6Ox(V5xJGC!jE-A0v)_+!-skrh&S>)^T7KcTrD@|LLK)$(u~4G*
>zBjP)J?e9^#4!6Eg66LfN#+to`882vzu@p)f{_xR3P$PnQ!+rKr;~5P(tW8k0_^Mzh
>zf_ic+KqKAFyRshzOYXXv2W~y3)=3DEFCs^aTcs=3D?i6M%+z9Zu5}4P5Qa@h#UDQZwwi^
>zBJ6Fc$DdRi3vC`x9B|m%d7-6zrq^xlaBBsJ(9G$@({$Z#bGI8sHJ4tsl-l&ApV>;S
>zQO>r+f4D?Hxr-hV>PxTom)dkcx{nUCn(y35s4cZJt@y&M8OxNdyy^%PktDKO-1d7s
>z-CJ(WH*Rf->NlY)f96#uqDAH=3DxAmOcbeE?)>DGMxTL&N~7Y1C$0ZHP-t8Sz8am{D$
>z%9X(IQG(DGKHjQx8-vuA=3DtKR+8HT^ePWp#BZv^Ph;SEU<J{R50i*9oTekn;5a?p)L
>z_Cn6^a}55Icjb7~S$sZ8tTMQbhQqK<`kfk};Z3)Gw)Vz#`)9Bj&DCzBaLguBt&NyC
>z(Jgw=3DpFPH$a<}EHjL`MC`Oog<11$U}36A!$<~IP1dU+3P#%^?cxq~(9-I2$acd}-k
>zJ5sQ`{o%21y1~0}y!EhK|A?yjk%MvJGn#SMZ2xVq01||>k7#dPqp!luu9w_Kqd@OJ
>zW}BgE%rdLpoIZv7m{ouq{4VnjH(E3_6Ez)hpHC7U)2<nlKC5cprTL<lHSYsd%ez_g
>zi`=3DwbtoaXIxq~(D#aCu$&e-No65b*uTiuFPZmCq29GgNfBBcrm+SqKB>3+sBkHo8#
>z#pH!V=3D1I5Z?G8Gg=3D#R~foZ1|sw&u8P+a7QENi1Ufx8*iJ1-h?~&DCVPwc8#Soz`#5
>zos_KULtf<>bi=3D&dZ8K~$J@N3M1+~1$dsV=3DsxkDH7b+ce8q>1xvi7}dm?$*cM=3Du<S
>M
>zdF7Gj4e9-*;x>H!k+{4hxA!=3Dw>ZbR3S1w8HLx`uPRC?;rg^mkZOt9NZyUlTK^w;L+
>z#J1<6le3Q)pOYr%r!z4e(e`ixWP}p!iDYsbr(_Tu%cHU4(NxOcjSoNiq>AnZ7mMi~
>z`iac{yrE%$-c01bQ%{1)djfo=3DD`y~tum*ssbC4JAz@f9s!Z>R!0j4G7Eeb^$YRi>R
>zlSYHVVo;kBNo)I%ZEI+h6P;0tfLXM`9`R7elxKLA$I*Fn%Me1QIZz4gnEwR@ovL;S
>zh3Wm&HNI8X4x3&lnIDH*Zw{GLhO8+=3Da9B2dI|PTNWfrWc>Rk4uST%1CL6CCKH}
>W_V
>zqDZBVWIi3zogdPddiVo5VP5qH<xvtv=3D-wVOUmMbft1Tsu8{jNm4+}ME;|mgoa-
>~BG
>zdT4E)*W5Jz^_&>ICBp!r+02Z|NtCbgF6>7U=3D1+zs?+$6s4(X+8FfiII!X{NKH9Y3x
>z5J(q7BA7y7_;BLf+965pP#Ud~*WyI^YVxmmpM18UYf$-
>seV0GPRN=3DqNBghl@hCCwj
>z<ssz|YfKj!)Psg$h2hj*eY$Udx<H%m$EftlVsamrB*(x-=3DQ8*&#wGB-1;3h{IN!8~
>z7kVb5VCs-!{*W|IpZvu>tv44@HhypXqBv4WH;^?vbi(v035UmgB6sBw^0R&3fP0eX
>z1S&rvkzdo|p?dPtb<xO%b9b?PPIOfAkn&$_lED5iR(wg!JUV3hiDe!cLP8qgMZ9B9
>z40!=3Dp!T&q>BK%k5@8SP-JT_-0pB-e5<C$|~RG$sH1_x0^>$ii*PyfUb{pNJ-E^+^^
>z=3D;mG0NpV{V`Was64WGzE<0KL&9E0-D2b-^or7`LUH|}1t2-TKV#Jm3p(B9}!tILlc
>z(fS^&t&nL~5u)=3D3LwV7SA8JVR&x5G4*(#<335Y?h;v{4zAm*+YFn0%47xHyK3`#c;
>z`mHK3U64Vg^lic_8Eldc+R*jejRsqiYUYk8rzL`Dew+Px>5sav21Smx4aCuYZeJ-^
>zbIQ5jd}9#w{8u<TppISzMp3eNFj=3DbCQfjG9*0_#4iRm+BJp~f3G@T?hFAp;R7(~yh
>zbf*RpvSl5ytxva<h>a!D+7e(Kkl0s%AI4|a4oZ##YKv4&gMP0WG;aiEOqgV92hFvR
>zwd+YHd(fN)eQ3xo8#HGRqK%-}u(4JN?M;N{?LqBtI%Z1ah}~d*8@kwk<cJlvk{}?%
>zpv`cN#&_l|R+)AX^*%M^Dr71pZt=3DlkAn8(wsp`E<#Q>lZ9B*i~bESH(B%~}R>LDty
>z7XdbpeTW^@@(wj-BEQogoc;`O#{iM^%j5~h{31vB5eSq5%zlIYyhF{Te<X7LBx_dq
>z(}!Vg(Xlq`w1B3v!LI9fA6O6}I$c#&-tVs#oyTv_PnfR+$MlS^q+n1X1If;);oFB;
>z=3DGj5h5CkG-lEZy~n<ak`EujyPml^X0$SE<oV4BMGBXQ-7ma4Go2de8(I5RqckWrwv
>z7_J$vA4V&c@uY6mpuR9V%Gq>c09IYMWN>ofk?@lp5WGT{vmAdOzrY^P32~)4br
>2n(
>zt&=3DM*`C?$wtX|2ya12EQ_P09#yF7W&)iThm;#B|}w=3DZGmSBFueNla>z2en(HCvB?{
>zLR-DZx^m|!Gkef%9Y7oD=3DSc`(whkbH?&1L2r(LfyW-qX1&!04x^!r4sW1uN!5DeR-
>z#W6+ms?Te_8(?M(qQ$x{;O~Fv6b@M!6#eZu3WJ&QsMFG8oU7>J1vdKLi6maZE}X
>G2
>zliY}3UATuV(LW}d^87^QowL%qn3k)7^m?4|Snkr-1`xGi;nFd!K7?BE$()ua10hta
>z@v_&B?-Vp9B5--?z3fF3b+OeVTL@L--O?BcCxR)5JR3{b<BuMTRlynfTX4+9I`_F7
>zF}1RTt=3D=3D#1y$^R_Ji3h)NpH^a)I;d|ZnA^vxNmA<nU?zy>M^eS_MchZsR3{p|Ksv-
>zF0K7O+qeOCn9!az;h6yhSv?mC7hSF4X$4>j8Y@JXzr>ps`I5(Q(IO-HEcRO*6J>I+
>z;2IiU_%ev1xh$gAQWMM@_bt;XYc9@O9I3Lmu;(Q8Ud;acrh6>2V!(EnS6HfQzDr3r
>z5z<o4&GTQL>1B@Jhv@xZY(4LsyftNj!S@SysieC!ZU3UAn+b?m&IL9t9yrAV>HAj=3D
>zAMRg$K>yQd<&46TlMCUtfc~1bmfyGB^V+lHug2^nz>SaT2ezIsfBycyK>W+%Ape;I
>z^mR6G>zk+K;#b72@z`rg+;sa7tPQT2mh@KBr|8Pg@BMss3TnKRIBm)7AmtC^oD8
>^2
>zlL@$);@Ra`vm_RoK4xzkl^?T4TbLc2m&hVafh<_SzWd4m7Wp2djs<}=3D;BHUM4m`R
><
>z#m~GiZ^Va|N}}z-q~x>vt)Jc3^R_jAHQfDJ+OC7rUEr!)t@mA@;`*iG<R$#w(tOf{
>z=3DR7VK;QN+u!M7hP_%q)1cwD5CBAa>2wyUqUe1n_QmG_>?ORvs*a*ZqLzNQ@4
>KJMUW
>z-`8a0w^CM;kKwKq8AWS9h)i8Z!nItXVhec{f2N3&DLV+{Yc1{9{maGt?9%&PH$T~L
>zIL!s;mK~~NC7dq9f=3Dhz>Ip5}>q85jzMMlK+TMWl<@$GIFEwaw;Z%XQKeYf9b>Nmf
>Q
>z*QCuL-^9<S#mN8M-
>&Xj@Z+k&L?#kWOFXgGgepOqLcVma*wSE+?UsjQ(j4n)vji#u?
>zpQXj9j4t`cex1Q({A{l@=3D5Ig`L^HQN^t^ZZSP2*3Khys(#0fG%l;7imkb9&36M`w~
>z&$rkNY9(a1dAg96n=3DdQt2xfObO0qOVslxOz*A0RtPw}|vBSJFjLWwq>3W*vT_zjmZ
>zR;Guo*#eY5?l~tkf_}K}$~=3D;{E?rtIPA-nFejSDC%3bDiPE=3DrrYCWVG-m#urUsA%{
>zcNvQxo~&?C6;j}1MwnOQ#`IZ1;Bc8XQ=3Dt()XckJ!P3@Q0VZRKK%5;^G#_ZGc!U}3#
>zjq7W?(Fx^w?i8R<WovRjnw|E9ChZAr^Al?O--r`NvllR?{2P&$9+9RDO<T4x?deBd
>z^)5|9zg8L2uMG3hEQ#wkN|$Qr{{Ms@OIy`0W6<IMJ^VQ3nvKGmnU>o>20)Yumz
>%cD
>z5X5^H9L>_~bLm3+nUH>C$w6(2mML?Y@a+s*CFqy*xFS~>rBdZMTX|gP)2}a#;zBY
>#
>zRryhtH`<`A0kaM6ep;oD?DrmqkOCCQlucD9My`~MxXfcNn^bFGPH9G6+CooA3+=3Di
>*
>zm)1{Z^gC3&uCfb>tan^ZE?4u8D9fr!upNoC=3DY)WM^&wQ*h*P%Juw~0Y@{0M!FBj
>hO
>zR$^SSOzhL<vQS5KKjFVG3-_`wCv<o5tz}`;?T04nsDpyYdq_Y-HfW~+EkO|`Jhm)_
>z{1h))9<%skm+}u2=3DM>CGF8khzbGgiiE+xPM=3DAz49K5?#$`M{+Fs9`KF`wJ82bd1@h
>z1jsP8E;~N6{Lx2Vbb(K{X9DisjV}86iE~zlahY~aoNHnXE*fAf^OnoBbK;zfdDBJj
>z#O~#?K;_N}Fb_Hxy<>uT4ThWW!WA=3DoUvUY)tq>L*#m}yYqm(b;S5_<)DW89MG`1
>2-
>z2^HGqCt2$<Qb#UaGH=3DH}uSg;{VU#KNvu`I5_zC75ygXB)n(abU=3D<nFp<*v5E84uUf
>z6iQt<ZccI;XT{nCq+UR%;RHD?*5@yOu`~GN&H#u^nijjNTDG-iA8CFLMxitI7r3cG
>z=3DJp_1JCrC1b(!aIYe!F|G|B&C?IbdnR;tzoxQY@2LEkrBb|R!igl?A0<9~nQ36anZ
>z2_HDs1|3F`4dC$S9i|0@j)X2tJzC31Tu5ZnOfX`Av<AdEd5F?N*fd_qFS1zjqmzkn
>zVO5qymF+~c>@Y(B3<uqNsCjqk?VRR)Vgbz)xFEp)9f#K>13x>>UK|5Tg3|E+2Lrj3
>zOVinxwoEO}lvQICTGrLaboK4=3Dxvqb^!|<YEPrRxMYfnE@vYi=3Dm>PDQYsxyaA*ZqcE
>zGSm6cJE^#EU4Fr7iHSynB9Wje!`VDVjUsPfIBaMrhj=3DJa3BFFW>lbJL)~L4h%1H+$
>zAFQwTcLxP->>l&D4<L0E$z1J&=3DP4@}*jCOr|Kvm)jW-tBml5Ek1Vd2Q8sLP$a<j@b
>z#%gXjUEkuJE2qzDa@qq4L&aW0?V#>!r{S8ymZh>}so@^Wn01J`>9qS3hVS<poP({`
>z@!wa5`@h*|nnD<~{Lng-B#^(4zgsCzt#g_LM7>~@Kq&&iTyz3d!kwYQ371n51Y>rZ
>ze7S~NCq%H^zYkaXyORzltj&E)4Gvf}!`Bo_SWQmmZ%`29L)n6W7^gCrV9q#cl4w2S
>zY|`RW*^&NR`|J~}LCp`{=3DZ7NXFW}FzrToA3F-JWpltRM#M<;U-3NZ^xU~-ritpwni
>zPwC_!-1j+YAEIfevw15VA(I+|sN7O#(&6l7Oerp1l>p%xUbQ6Aewz%vD_~Nca49^&
>zA_!2yd;#HNCqQNfRNKc`YnGGA;%28IFqA8tz_f+8%LMC|2<^k%g?J)I$uMhO;$-G=3D
>z+^L3G3s27^IZcD`5DqNM0Eac)2~gR~wt6|6W;rJvNsk?*KPRjAn-iRppZic4sA7#T
>zL{rL-NnNZ{?=3DgnlezTF)=3Db7*N^od%%9}yXLvd%{bN?r=3DKQWxQb8wZY4PD8wrR~hB+
>z#Q$17Pi4A7UWov$mDKm4jTYFXegxbQ-aDg}9@3G{qJ%KGN)>Xt{}HKU`#f`jw;T=3D|
>z#(T_jg;7UdIBy>9(~R^<F7)XddZ90O#5MCLy#W+)uH@Kyu<jO;>F+cCZn)_W$?Ci2
>z!0<lFTQIRvsx`r-#s;&a5608)lA2EZ-V^hu7g__-tm3jC`}PzBXuou73j+6i*<$`4
>z4?i&@l$K2xt+IO36gz?ZQb!D;b2*)c-FWtz>G8CbtNO$s`XT3>Vas*HHFQ>RyQ;k5
>zyzHE?D9aAvrbQBHpMjrSlRAZdo4g{BeA%n{vRA$q*R6?s(%5H<(b_SoWBT-4L3kiC
>zaA$ouf2X)lx3QPm)XVuh8GZk!zhkckWag!P`dMkP1SrC%B)ZDVZ+#8N=3Dfp0cPm^E|
>zBP5UZnU8R6Dqklxhx`6>mL)SS1uyr)V|r=3Dmq1vYdbJAoGZ8AHtHYaAeyjS;VuVh9a
>z5*Q1`#=3DPamLMbQZv?G&_gf?%*xf1&b%ankK!3qP(=3DIwomZ=3D9u?&A(8}ZQh1K%~t
>Hl
>z0oUP0SiH#4Tv1<HUT;n^Jls!0?}1Btj0j!Hw+ee@wdD<$oA$qF6R5wOPv_h-G|vvJ
>zzGcnnYZDyq7ibw?ubK^X_KI(uKmXn>UQ6vj%M?O4-lG}q0c&@rBCS{@;+}*TNsSNn
>zO`g`LNb5t?O#VzBydwg$19|ck{A%uWsk|3#R|PmAlY3BaBy#8V?S7t+smsM%%7s
>Oe
>zIrxj*&*v%+Pu?))e%O;t@zN-&kRr4csV*Yb8G%GaVCo#PqNYb(B!-KhEpx;<8HU^*
>z{Au2_NN2D0%^pp2Pik#B+%N%Ok&%~9Bat@i9f+Wud5;L~ZxPlLTr<2=3DF!RZDiq6H
>m
>zo_vm^@!co$;o;!?r;b4W@>8=3D@MLkX7J*f@lw;P-4sT=3D2S@r-
>xFjW=3DTHArj&PK1xD0
>z$_2n0x52>8=3DM!23`%1)o>*ikMZ$av&O*rA{DB7<_cmi%jw5!xr6^8y|&h|k6f;GL!
>ztI%70kh&16A$oA>)ALoS9>Mtf6fa^%d%)<_jWZ7b+CLs=3D{>+sD`t(Biqe-X)=3D*^Ws
>zoP^2`$4&0BN%UwX3NMiMYQF1E-CeGJu?czYFUni4)>1^-KfB|Lef2Bm8kei#zBzBj
>zTpLA5f_oZjRebPkL&t>QQ=3Dv7&^%T9GWTJY_QN3WTn8;qUsF#L}sMlg(l>;mj(Ti?E
>zyvKxlDj*Zak<!mH(*Y{`S;)5Xdh(t)NN*-J!5nAn<MWCW@-k~(LA{KBuP&fhUmRyF
>zru&QI8FRNiolG<P_gbg)Hlf}!VDpK#?KARLR5ovqv~7>FY>zg6x!a^5^HvmV{CYXI
>zpVfKy>bHmVZx1zY57us<#_)ShDY$j*Z27M}OMbMsvrIcDGl0KvGW>NCDgpkRE8AJ
>7
>zjcW(kic_A6+M*1aR8ozmTdwN<?@t!xS9-X&V17SBG<&<{FZ|#7f88Vbx<_{gfBMX{
>zN3Qk2Gc?bmH_wK!e$j&jmL!F7<ICMA&?)AN9`n^6v{Ps6X){u;228D!MkzfPIvyh~
>z`J^ZJ;~vH8ZuzQi&HFv@o(@*5i+G%tlDhYMwC~>L0<pI{s?OMIPuot`3C-twnDaew
>z>#FqQlyveO2t|IHdEK%)h4r1DGFdk>2iLEQk2}+&iSGtC-5k?xs4A~L-E{mIY#obq
>z##lo2Xw&OGF5J@^)r|$~CCgswVP5JnKKDESr-C#`fs1p=3D#!Q_tv%;8p%$QkaERK;D
>zN9c<qlZ$D4&+oIJl7a$W3o`G=3D8SCQ(%4?Gn&)tRht{10l>0!2T)K-Ui4pG{lY|8Di
>z7WCM5!d#$(5BJS44n><|OP+Q^23(lNJ;g)d1fl7gb+~1H9J~@GS<{1s8^VLW??wXi
>z)NWm9kLISMU#hZR$MZML=3DU;Z1Kf${<sAh)t?9Rt!p*{CLv}7H#WK~#JR9aTNYFY88
>z!jfod)&WUCk92!vlv6&2!}7&mzC9Z69=3DtUFQT}*$(<t7ZA4ay}WBDS|iB0)Sr+?nv
>z+SuLpJkSX{8?60z-STg{HTUpHew5#x?#OU?W4ELc&)6vP`Mg_xwOeDuij7fzSGv*5
>z@=3DM(sGv2;YLB5O6ZBzxk(Ovdzw?^Ns({(eib(>$s3pZ^bcVN6JTehJ)na4dqot)(5
>zvgO^HZQaS+)!OZcrQ217-;sIChcCPh4`b81&C9x(&3NkOh_Jccuv8CkX@EAxQ{4!i
>z4bmuZ>gN0@ba(3Q!Gh54+*#e41blXL0{JLz+AJ6Fx*4k5MRYe!VD#)G8G{Zzqt5Mj
>zD1y7KBaY%AB+z=3D3QiEEZcv!khTj)&`uF_msE1A-5QL5XnE?nY&<{RVc3gha1{Yq7v
>z@^E3sLdDPc(6ceKCmhQMCqq2NPY(I0BlkN8JQqHOA`AZMu>6g%6se5glC~nXe&w
>*P
>z2Y>Z!m`|^Rx#3XU#y!tQrnNhy+oFw1@Zl|dZ9k*7{@c-X*|BkI;ZAkiPL*xv;RoZ=3D
>zH5Jk|`y@X&;41oy`>e<D@kNQcOAfi!A+h4@Eux_J9g=3D1Tifm@oin9*gR}RfPc;A-T
>z=3D_ehMla7bm8U!Uj=3DTN-s$bA!kuthTUEeBd0xl>W?=3D%)y)5w~qg_Iu3{na`Cljw*;E
>zkKn}x;wdjVa&ltxGAfcomgW8t7Z=3Dd+Wsa&-3jMOzDuT4js?wC8Pl}fv;FL}7MMbd#
>zr7TQtRpN^UiE!ulbHTJJ{#|qwymPan)Jr4i!en7^c$$MLc37k;+dGFEE^BRXKi+WJ
>z27VI*Z(tY3`)qWWH#nLW;QYeqoTnW25b&?zj&zvwD{~yCQP#AKdoC`d-
>CWHo2e_(W
>z#623Mv2@C7JO8_#%T2@A3uCBY2ktFgIVav>=3DRA27q3q@`#W+lT+=3Dk>NEE(z2Qm
>2Z-
>zLZGqSbBB5g++#+BpW7O~v<KQMhSo)x<`G7!LKozKC?)N*CGC{HFkE!rm{t+xRIZpb
>z0}OH~NzWYiU${AZ9oV`xI_c{!c&aB(wEbqmB+Xrjucc1QN4tu`6lv*1TH0x5q>CP7
>z6~kD#Eu3^=3DdRrXXiC1k4fAp6wm}k<|{@kTys`N<5EbScnV+_2|U`dJ;{m{HhXAu&X
>zRpsV|olVX7^=3D)FZ34ge47WpM^-4;5>)&-7nl(X?ngE7S1&_#2FqQsd-;j1>LYH0r>
>z`t04JuBMRAw(M71gFBn2TzA#rL}gt3dtI%@E~DS8&3<n{FPPX&bvDlwiEh}kUPXyk
>z0=3Dg3LTnxXcoCnWgYLpS6Lf4dw79Q$~L}}FSW@&8dmXO<xTV-
><tYIwG^Kh=3D9TG?bgx
>zk8KhlLE~0E^#%&7I*a9h=3DrY_cN2{2<cu`Rdn2F6rp`xNL`xW-67br-V@(OFA{v^Cy
>z6iUf1i<xKfYen>|wOuPO1Iwm5R+O>gjV_~9RJx*WgQt#J(*^zPAF&XcEFr9`@Xtlz
>zek-~V&n6AaosY@wKT`f(_+Q&YDXI$(ZBHb>z>?xwWH(-
>2yiXO^p?RT0FO<Q#VO`RB
>z(l?Z$JFIjE2)e=3DZ<_J88C_Q}{F81ei>gECe>f6<ay+?mjB6=3D!O9U+<4VO4e*gF@=3D`
>zaAaw$oyRP{t-99uQhXiXb4H_RM%V%FL}wzJ0-
>$*%Uu0_#<BXDk><>C`o;OYW=3DRUxf
>zxN?cf?vRYNYXxeQ9bX(`S*f;Wb-=3D~8kp$OS=3Dihl6rZ5k;TZh|WJ#?sZ@;N2*Dt@aZ
>z0+i@di8x;mSd~K@R?v3MPwkxdn$Wn=3DG&}+CMffd;SCYf4#N`ingMFN>?qX1fR-
>mdb
>zhFOrGRnnnfse;Wh%$mPyXVjhNKnk9nBfo*?l}ZAw97bt6-=3Dn9ek|p(cdnxz4@C5un
>zi~nA_V5;fe3C^`VGqcIi&N%Qu>C%v@c8RVX`J~y#;CYRR9$<At9eCMuDpG_$e@>b
>Z
>z)JgZSM#DC9V5hPN))S)n$#cUOm6!uMty4Q0VP_NS#Qr;CBfUBgI3NIJ_?-u4*?U-q
>z*LfhH8?^|u7O&YcP4#{UGuFY`AZ7q;5WR_IMm)v0JGkP;-xiS>>_9h_pn3xxXtAA7
>zFh@F;+*I;^KmH|U?FrP9&nor6ujX{eLSC}R8}`Uz)r};fog_92z(@gDX)!dw3o{#!
>zTMS14BZmTa?0BY7+W~^mW~qQ-
>rHcg~8Q*q^Upo^173|6ZOWHxhbpu>Rd!ASo{n5o(
>zJLI2spxLeU9j?nA{e_3y3SVw6Jepj1MEMPyT=3D)`N$Xx2sUFy&m9xxW}hp>#P`+(Vb
>zib@OaNX^{4at@rhi=3D>kaU-_hNYDWd{m>)B>BTE1`36;}Yyg0fzrI`II@;e#k<rEX9
>zjfC90L*dhbU)uc)-_<VZ$KURr#qVq{Xvbb<ap>oET}yjuA)K0JKj8&s^B!$(7w-%v
>z#02NZtS^&%-7Yip#J?6iM$QZjvTosCYQNbon=3D6)ORL!>%tycV(vIXQv_@8BQ@b2b=3D
>zvKaok_NI5SWRJxEOnbwv+Ky^58_>cAw7!mW_sm;d*)IN-2k*uM&Pilx2JYG5Al$4R
>zYwto)PVuk7h{`m<G%|DW!Z+4^2rue$uS{CC*t#ca^S<^hA`@P%;-#YCv^GLf-cF$4
>zO#X5bPB34}j}kv$K<;j@&LMZU&m<lT03hDUYaj@DNqYisVKA|SCkA{3L2hpkZD0*t
>zmJ^q<9iGBVwtbNO!XQPS{Xp@DPmk#uwp=3D7*sj!ai@OcU(v<<$oDT1$El!UAs@;d
>WV
>zC#xtjB&q6Y_}Jztj?Bs5LdfSlNyw`6;Ijxw1Mq=3DI1EfeuI&+9uIn)s+1HH-Vs!Z++
>z3i#dGOvosJI{-p-O5E85U)BIj0_Y7ebt8P<0B|3aLHCH^d_pDwcn9EAfVBVv0j2^B
>z0w@DG4dB8Jge(+bC6uQF^!4%f_JSXO^7pZdN6N_v&&LqZ%0W(!9OS6Eu=3DnH*J{h
>OF
>z2xYVfz7qk+rLZ#iKm)#K`K|o_7^?n%P4r*pIoaz)?vc-hFSigR0@6D8Kxf}fLN*st
>a0HgsZUxZWzDHRgPjyU_V&YOIG<bMHnNY+vS
>
>--
>1.7.1

