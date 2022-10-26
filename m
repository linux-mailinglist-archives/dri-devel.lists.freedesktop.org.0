Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F25F60F111
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 09:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD9910E357;
	Thu, 27 Oct 2022 07:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2879 seconds by postgrey-1.36 at gabe;
 Wed, 26 Oct 2022 14:12:35 UTC
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFA310E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 14:12:35 +0000 (UTC)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q8tSwe001095;
 Wed, 26 Oct 2022 06:24:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=qGqZQA6OUvErCjR8JReXLkKBa0l++UBH1tN0ymGJoOY=;
 b=kmxQo0zWdHvwNyvc1+Hl0I3orTCbifRWsHN++8VHBaZ8NHIuXp2+w/VKZj4rSbRjugv7
 VIH3IirFae57/lMfaMkA2ffBJ1Q1nKZaD+my6o5sUvjEMhsDYAAvOjnQMGseJCwNfJNt
 sc4lG4PNxa/K/OetFeZ3UwjDIPmXgvFtA717TjL2CzCuPo2BCtH8+J6kExRdNl9en/sm
 1SMpbz7uAEjXbQxGtJnlZ3tJ7pXZYdAWnhxorb/lTAn9TUhai9SOnGbMdoYm/PABJTo2
 yk3pCaQXGPwmeV9b1hQXGctu3E9CseMqF+wT0RK1UC9Dy7rsuFkc+CssBizfQVvMsA9f UA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kcfew56tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 06:24:19 -0700
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D060D40088;
 Wed, 26 Oct 2022 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1666790659; bh=bODJlsnIgeCAlUZj6q0/r0By1fzKTPX2Cizh29MYOLQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JhDqN/gJgjWu6Nk1U4woe5BbfJ65lwHShgxihDmIH/bXLGVsJ8kwTlt8ZN+2951ph
 sCR4UvjsxzvzmtEQuBE/qXedUwMP9QqLesKFb/8E0D2JRvDZAAJGqvTRutRb8PqFsV
 3OIiHwZRG82pabIMTENu/XeL7p6y6gyh0JaC3UVy4Zjtx9ZCZ0b34l90TIbwkzbWNy
 UnodPv69AXFJf7Gsjs97aGxph9hMoc2gDSrzYiMR4glHC+U9EVoaqYZWuDbbWuzwXl
 7bC896oWRg01fNq9Z1aRVaC6wNLY/po6ZaPSmDE1tVk2TRAwClUkx6luBnjiyRB0iK
 4S6XBOVrjq3qA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id DB597A0073;
 Wed, 26 Oct 2022 13:24:17 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id D7F71400D9;
 Wed, 26 Oct 2022 13:24:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ktYM1AnM";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQdokdQVSBHFZpDvVhXVuQJlDM8bQdhIy/0dYMqclDzyswWrW2YsUZB4WHQRk0gDlUvt3misJna7Xk4La6pAxb886Bhr11StKQv3MbZN1VqRR6NzcK3SgxpSptFMgJc4+IomXEspmgcAefs/RCdVeJtv3LeYXeZ4bh4u1yBawF2Mhryp1anh7giCLEkkIqUlUgFNK0JMEe8d4R7FN6fM2nyLyYyBYlubKhuHED9C/ccoreTlbKUa62aC4324iwTL5wfqf6jqvS0zmLVJ46kGS4Z3Okzq2owIOQMglo7/pOy3z5AIOIk6yYhisINevu4CWUKPv+7o/UrJB0Kus1fUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGqZQA6OUvErCjR8JReXLkKBa0l++UBH1tN0ymGJoOY=;
 b=cK9BhKrNtvzOQT9iV6sSjvbg4HIjXQ0QK2yFpEWogeQ+umUkPUEtPXDYAdm/wooIFu+VWGi/R2DpF3wRKMOKQnEQ8QsyASRFEyaGiHBT2yUkuq8GNGEagK9eWSQEjb6fsUI41yzI6s17cWfaaC4xzIseX5x5koHrEwTIYtm5JlRWUZPLy2gPFUnbQ3jIjj11RV7qK3sioo29oqh+Keue0DckSkTSVrS2C4Jo/KxMxPSsEY/uf/lR5+dpl39aASOjA70YQSSpE9R46eKH5kcKcLvYxXJftZohPa66xRRn2QPf13a12Cbw7SyeEIMmEeLjrbqoxQAYXKpcBpCpxt2xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGqZQA6OUvErCjR8JReXLkKBa0l++UBH1tN0ymGJoOY=;
 b=ktYM1AnM63Xc3c8FedJ7M8QdtPj+fcn/ntw8Y+1yeGN6SAdZbhG4cdYxW/GXQUxEBCwaYz5tqbAUomxXOPy7lqwLHyguuRI3aYOKiHgBJG4zxhg4IAePEH9HgPb0EOks9MA8pkZQCr56mX/FgxUCy09U/CCmjcrkPU3M8K6eTts=
Received: from IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 by IA0PR12MB7651.namprd12.prod.outlook.com (2603:10b6:208:435::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 13:24:14 +0000
Received: from IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::4b86:9481:db49:5863]) by IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::4b86:9481:db49:5863%8]) with mapi id 15.20.5723.033; Wed, 26 Oct 2022
 13:24:14 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH] drm/arc: disambiguate Synopsys ARC in Kconfig labels
Thread-Topic: [PATCH] drm/arc: disambiguate Synopsys ARC in Kconfig labels
Thread-Index: AQHY6Tex2Q0vzmJ1wUCOm7WGh0d2za4gqYsh
Date: Wed, 26 Oct 2022 13:24:13 +0000
Message-ID: <IA1PR12MB62103A055051993FFB460789A1309@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20221026123640.42731-1-kilobyte@angband.pl>
In-Reply-To: <20221026123640.42731-1-kilobyte@angband.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6210:EE_|IA0PR12MB7651:EE_
x-ms-office365-filtering-correlation-id: bcdbbe15-bcd2-4ab2-3649-08dab7556026
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zHaUpCPNlV5LjQpDj3t7jTSzhMkgLv3XRodwL51rsA3hIc185uCxqOuTALAcy1UiBHhmeS0LSQOpxkYyUaDVR6egr3/2k2M87hKoZ/pPlQO2b/J/YbasXzCOyDA3e0yIGAQ4pu3YDF9Bt7L5x5lvnv81Y4IQ4hq+Vocu2+TruPhxl8pqshVlReaj/4UAnFqQKk5LIOpzV+EhHC8CbNQeolgWToTuadaqm+x5g6X9gyA93+nBgWoN1dhim+PtB94QctRX84B5kpdeLHJLPdzU9KEGMdT6g/BTMLMgw/gQc7S76PopHy1vfLGFA8P6xxcPmuDfYvpt/wkIJvMsd/Ha2V79pBX6B/+tL8qjdGHADaPFx230h5oJX+KtDtXB6JYqpEhWIeqgmzgeQ5JA1Wt4EJ0acrnBdg+q0AXkRdrGo5aB4FTZXB8v6NS4SvIsb86RiMFtTocsfg0mDzW1UHqYgYA3MMP2hQ2hsoWgKwwN2qhEUYt8uQzdmFaqdwkOo9/Rx3KcmxLMRMeAv2K+07nneanAbpCs6IPS55CY5fl8yXogYzc3dXS8H2YtWLeZfkuvGoeyQ3WrRVvDs7MWY2fjlrlWlHDxjlnLnZ6yWpxfmoev+LNbMgJL1n1xjVfKOZu8ZoV85cfg+g6m/d7+ISK7f770LwP/XM6T8tkQkzyjKRDiCij5IzjrPPibgapTqw3KDVp0IIU4Nft/iCdbGzPT+NK6ZMy+vROnp8BfQgZC27unZeUoFzMzXFxPqd9IblZFmi0nHDHywqsPXsjuQ7AyAA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6210.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199015)(122000001)(38070700005)(55016003)(26005)(54906003)(86362001)(66556008)(66476007)(66446008)(64756008)(33656002)(76116006)(4326008)(8676002)(66946007)(6916009)(91956017)(316002)(38100700002)(2906002)(83380400001)(5660300002)(4744005)(71200400001)(41300700001)(52536014)(186003)(6506007)(9686003)(478600001)(7696005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kUGAzXYNdlMuFDhiu6SHLXTDdqQnO6SLPSh/evXRKA9J1Uk4Tby8HVzgo/?=
 =?iso-8859-1?Q?OD/9f4kIE9vYYyye27uoFAxx6GS+lpj0SXSYEdoB//zAo1ZwcvskqW53hD?=
 =?iso-8859-1?Q?P1VHfkf59NSHsianZHgoHT4BlUbPgpemZfZoFIYkd5rUa0Rrl7Ck8iiZPH?=
 =?iso-8859-1?Q?t09maZ1nM7S1JE+cSok45KUEcB3r3fYq/WnloxV0vfnq5jVmhMiq4vW+pr?=
 =?iso-8859-1?Q?oiBgjHe5UtKK1ur4ZVdpvaTV3ecVs5PHBQFVpHc/B7fLE9zAqeKoeH8EOy?=
 =?iso-8859-1?Q?7G7FLTKZEnCO+t9G53d2C6LKRnkUBIZcM9bDAqc2batSL4btUKjpdHsWDz?=
 =?iso-8859-1?Q?UyQshDWXQaFDJT4lpcmOF1IwIA4f+x8msZ63++v0j7ZK595nTEORHk8zUv?=
 =?iso-8859-1?Q?SoixTO57frEMb1D7Ckp/SkuFZ+6RgBoMSO1nicW4K4Qq7yq4CQj7DzUUSF?=
 =?iso-8859-1?Q?emNxc5HOZWnaQmfjpoIYzCRovM9rZLFJxnW6MgZ5E3BkRj425QK+r3OJam?=
 =?iso-8859-1?Q?XcVnj28SKFu6x0PPDRY44OmtuIHGyG0nfHuIiqFroTDZv1C2vjJZZ/99bt?=
 =?iso-8859-1?Q?UEwCWk/8bDWvwUrQF93MkO4wc3ptAm0NmjKOaYxXmWm/ycrleLQXBNzXQm?=
 =?iso-8859-1?Q?9aNqh9RLxuCCT1SsMZSVx3OkDWdcElkEi1ms8WtJzA8zFgcTLL3cNjKatP?=
 =?iso-8859-1?Q?xgj2Wo8SuejNU5xyQs9ElYGjOwdBCqdziSWRyR+NmAs37rWurZTIHjy4N+?=
 =?iso-8859-1?Q?ruEwNLjXfT6augHYAqFNr5c9fHXgJzfIHwJlLyYES7kM6VIWi8l8Wr7SR/?=
 =?iso-8859-1?Q?OPPuVV5Vn+M/G4k907EArJnNktJmOZ+8hCKcJGdBnbLksTpqVvfYfMGDq4?=
 =?iso-8859-1?Q?gsmvNBLab5qE6z9EQfEbFDW3RrKwqPBWNBxutl/8Lw1KigGmJNDMywo8hs?=
 =?iso-8859-1?Q?32mYrALhiTeZ8jYeUwmDSjhbmIG2yjqUCwLnejCiKJwXwpDkqZiawNN1Lt?=
 =?iso-8859-1?Q?l//LwgR4RxvGLL3L5N1IH39g9NvCAvi84TxpMPMkAFzKEgHeiCArQRIkH2?=
 =?iso-8859-1?Q?e8UlLQ6IZ0ApAb8uDPt1HjgA0Ey4MQ+8omTOWZIgcvomvp+hZrGDoiCx0t?=
 =?iso-8859-1?Q?yYLRXRqc1U8wzSPMmatP8GceDCoBmerFbOvwfxQ7Q14HqR4z5KlPZKXGmb?=
 =?iso-8859-1?Q?4Rga9rNSNvg4XpxTzCPQooXH5wEnLHyPkO9heP7dXXtxvp/yCjsiYNg6ZI?=
 =?iso-8859-1?Q?wAiX3qpm9NpozNDv44BN1v0d25ijrA5ibYJbCB1d1li0O+/KroU1GWhRv7?=
 =?iso-8859-1?Q?0S+mTz3PaZWvd1XhTosmcRxmP9r0rQpsEzM29cBRT2FVq+Fo8d7uyUtkf+?=
 =?iso-8859-1?Q?YJlLQkJW0Ki0w/koblJqAKV0tL+C6MlKSitFvdYUClW5IBmKWaKlvgdugC?=
 =?iso-8859-1?Q?2nMjrMo9QFYNKMVC52WKKkpWZAaEaupVjnK0kF5x6lAdSolcymH8YTp+xh?=
 =?iso-8859-1?Q?/28ur/HVrefAjUPUGicQeJhj7rYXN1bzt8LZUPEp/46LcXsWwx76Y24itl?=
 =?iso-8859-1?Q?eiJntJnhELIZNNakSEpA+PbhYEdyw2M84/AckUd0WavcGttgwjXqh3s/XH?=
 =?iso-8859-1?Q?+zh3XkJc6JZ1QfyLIPg8blbmknRh2huUUS?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6210.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdbbe15-bcd2-4ab2-3649-08dab7556026
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 13:24:13.9254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1P6Da1/OHIDiDWBWUlCy4BDejXZ37CRq2s3PIfnb/4YIrcsZPGYMAVHnqQUi/Zjzhw6t+plJvk6zy5YWzpreKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7651
X-Proofpoint-ORIG-GUID: FU3TXZHbRKg9LFFFNVPw6qOHlGqPE3qI
X-Proofpoint-GUID: FU3TXZHbRKg9LFFFNVPw6qOHlGqPE3qI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_06,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210260075
X-Mailman-Approved-At: Thu, 27 Oct 2022 07:23:46 +0000
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,=0A=
=0A=
> There's Intel Arc now which is what most folks will be looking for.=0A=
> =0A=
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>=0A=
> ---=0A=
>  drivers/gpu/drm/tiny/Kconfig | 4 ++--=0A=
>  1 file changed, 2 insertions(+), 2 deletions(-)=0A=
> =0A=
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig=
=0A=
> index 565957264875..51b60c1a2bea 100644=0A=
> --- a/drivers/gpu/drm/tiny/Kconfig=0A=
> +++ b/drivers/gpu/drm/tiny/Kconfig=0A=
> @@ -1,12 +1,12 @@=0A=
>  # SPDX-License-Identifier: GPL-2.0-only=0A=
>  =0A=
>  config DRM_ARCPGU=0A=
> -       tristate "ARC PGU"=0A=
> +       tristate "Synopsys ARC PGU"=0A=
>          depends on DRM && OF=0A=
>          select DRM_GEM_DMA_HELPER=0A=
>          select DRM_KMS_HELPER=0A=
>          help=0A=
> -         Choose this option if you have an ARC PGU controller.=0A=
> +         Choose this option if you have a Synopsys ARC PGU controller.=
=0A=
>  =0A=
>            If M is selected the module will be called arcpgu.=0A=
=0A=
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>=
