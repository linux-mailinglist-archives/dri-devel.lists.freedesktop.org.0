Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D333563AF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 08:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C76E04B;
	Wed,  7 Apr 2021 06:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823CF6E04B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 06:04:57 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13763QMX013438; Tue, 6 Apr 2021 23:04:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=wBtqvZTKMZ5Cxss4E0dl2HqbgQaq206t+mXQf49tdmU=;
 b=BoccT2WgUbCp0wwW3+523Ceg55SQLRn8LGvLRKDMaAp9bmKgQrpTRVdAh4poQR+ZCI4Z
 ufzIj7/paimd0L8R1jNm8EyOg5Q7cLfj57/d3HfSZ13ThOz15zZpkB493PdbkSAEU+TG
 8Dk6XXSiILSDAvPeLVWZS6quegX9PXBMBh6bKjHsJtVbXxt8Lo4VAA32+cIbjuJvEMMJ
 NuhbL3OJyzl3G3f1PlAz2AgvqDIx+u20goMj4OrsMr5fg9oRwaMereDE7raCnX7GH9Lr
 KTWJh+c00au/tOKAtYedR32L5eq5MoShqwPsX5bRr0BnB5DkoYfL9zcoj/7nSi/dRgvg Wg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-0014ca01.pphosted.com with ESMTP id 37rva6a4gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 23:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMURmVMp8M5dcK/I8oM0cbd1Xv5dbB95HzbBiBUnaqJMDdCnGLx+kORGZFhhtbNh7ROBTmp2dTMDMGbyYCFZ+IGfAUHCxX7Qd9tphzbmvCWkPv0Gco/dfmhCnnjf+zrGZbNrodUomotAGMlBpkn6YDIV8feTLn7N9rgSi7UcuyGxPW13cJshHLHP3J93YeCohUxCc5Xw1NqXjzisIgvff+aSXlnX404xNjeH+m6TkOaJuNSbSh/df+/09JTNff0DRh5Z/FN/fRGuFBlMfX3sVwXTzHYIOB6HbgY37E0YTr6cY9DPZLx3mTdR9ru7tSnGfDS3tKMAsa+a++VHZ4ECAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBtqvZTKMZ5Cxss4E0dl2HqbgQaq206t+mXQf49tdmU=;
 b=UJvwR0AuRiru6u2poKBMMDyzCepata49zkz4eTDhS5vO3h3tk8fgUQGcPhvx8IDjIefCrBIGI2e5XujgZ9wt09ZPjLjkLjgu78vgfb3PqJxRYHecGKgRDym7t/bSNovytPRx39BhBH7n2A8wjbkyAP/CpwYk8pB4cKnDatqm7C+d0RXImGN8JTSeA7mvyiOO2Kd1lyAeRmRDD46uKf88LvsYt5oY4AyFkHqh1kqUSpVll1dwB114iH7xb908E9poRdHMNKALkX7EO8t3uzPQb0fEpRT5OizP/mVU9K938WijzgVnTmSTS1Mbm5Uf1A1zaYFm47E/IHFBzzwwzlXAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBtqvZTKMZ5Cxss4E0dl2HqbgQaq206t+mXQf49tdmU=;
 b=rE9hsd1+PPmqfjAW1vPyTY2Lne04Hm9iXJQyjR62EyjO4OjF5aCF1/rADz/ZlqYtuwHBs60340MznBiZKeFqFYN28Hk/2+ZeDJw7ynT1g45KFNqP2Q7BurRlLKgLCZT9qWy/C2UdFCizF3QiHgjXjq3O1qSSIG7B7+Km7vUnh6Q=
Received: from MWHPR07MB2768.namprd07.prod.outlook.com (2603:10b6:300:28::18)
 by MW2PR07MB4012.namprd07.prod.outlook.com (2603:10b6:907:3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 06:03:30 +0000
Received: from MWHPR07MB2768.namprd07.prod.outlook.com
 ([fe80::1a8:764e:ab3d:73c7]) by MWHPR07MB2768.namprd07.prod.outlook.com
 ([fe80::1a8:764e:ab3d:73c7%7]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 06:03:30 +0000
From: Parshuram Raju Thombare <pthombar@cadence.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Thread-Topic: [PATCH v5 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Thread-Index: AQHXHKOi/86dAQ9N3U2czyHmDrT9E6qSMz8AgBZ3t0A=
Date: Wed, 7 Apr 2021 06:03:29 +0000
Message-ID: <MWHPR07MB276881500489CBFE1F297C1FC1759@MWHPR07MB2768.namprd07.prod.outlook.com>
References: <1616146664-6941-1-git-send-email-pthombar@cadence.com>
 <1616146709-7227-1-git-send-email-pthombar@cadence.com>
 <20210323224546.GA1485576@robh.at.kernel.org>
In-Reply-To: <20210323224546.GA1485576@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccHRob21iYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1mNmRkMzhjNC05NzY2LTExZWItODYzMC0xMDY1MzBlZjIyZjVcYW1lLXRlc3RcZjZkZDM4YzUtOTc2Ni0xMWViLTg2MzAtMTA2NTMwZWYyMmY1Ym9keS50eHQiIHN6PSI4MDYiIHQ9IjEzMjYyMjQ5MDA2MDA3MjA3NyIgaD0iUEt5YlNOU1ZtVTlWbjRHdWZQUmZhVGQySlVBPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bda3544-3356-4aa5-93ac-08d8f98ade24
x-ms-traffictypediagnostic: MW2PR07MB4012:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR07MB4012F1B415BE78EF83DAF3ECC1759@MW2PR07MB4012.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h1T14R3rPHFqtHiMVtXrP3/olImUOx/p6bxB4ojR6hOo8D/CXSzVroqDsUodY3OgidNGcSMQ9eLDcRpFYGhQMaUF2E7u5AMP9TNWK8mKnINu+vxGXTtJxs38zOMUY80JYODx7JhRky9vUlnO9cOvj16S1NJMvCDoaWgMdSwh5Z0cuIyg+xNV2w3XudNjJdef/Mxrw0krCpm0vi84vgfksWt89PxRdwJVTUTimxOxMxTuTDcizUj0uR/qUFnoOCpP0W/Z3RvmIdyZc1RzQ8ydvl+DusvVxDanvuXqwHJiGZfRRTlDMF1t0taf5XdVKal/jBpID7kmN4ep1ZnqW5E3hryVKQ5uOWcBd598kj9o07fad0Ufr/Yli2bc8uWjn65H6ut18ccs1nygbjn3//osHzRWagQypGdpWsqy/RLAfpoan5VJE7MmBjCwA9CiSg3UYkFUZgiEXrxRrRUt8nOWEjGognv0pK6ZlquWraeFwyP2fdw/5eY1B6ocj8jdVwMT00/Ia1jzRQoGVl8ML+cICEQGG0eEN7efGgVM29WHrTxpmR3g4TCQ2rfcFHn04mE4K+nE57O2YPAKvP+OIvA2BW2SNbW/unssaGeNL/hc89OW2VXRI7bBl5FPMMyr/FmlBMqGpMzQoQS9tp1HyfPuFC7RoKngEK4/YrPaYnBf1vEoJC8dHRDN51PMa9/L2+YV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR07MB2768.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(36092001)(38100700001)(4326008)(71200400001)(6506007)(7416002)(8936002)(6916009)(316002)(26005)(55016002)(9686003)(186003)(4744005)(107886003)(5660300002)(64756008)(66476007)(66556008)(478600001)(86362001)(54906003)(8676002)(33656002)(2906002)(66946007)(66446008)(52536014)(76116006)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SFg/q0bI8RtaNmwcbY2IpVeNC2PRsF/yNO5POiY/H/5Rrd94r8Jc3Eaz2GJt?=
 =?us-ascii?Q?yPn7jONQ/r1UgKpMv6zAVBiQj5X0+fXeNCupdHECsA61p220LvI33siFAwx5?=
 =?us-ascii?Q?DOLzWed72oCbKbugAZ/DD2/MkhZUS+7oZFIIO3MK2qUIuuPO+HLb6QCY2q0U?=
 =?us-ascii?Q?jztPXQfqWKfgoL5V12hHTMqYNImn/AoeYEM/j32XgU3P+sez+vasbxQ8AtJO?=
 =?us-ascii?Q?D4soB3vXnaTsRENwpZQLoxNVuiBwcCJA4BAWBwDQHZyMYZ1h+bDAXxniSxJY?=
 =?us-ascii?Q?EMAj4sSK1Cm6VxRYIat9uEri73XM20MqG7Dnp5IDQeZpJQhWc7EjQgtkLFjL?=
 =?us-ascii?Q?+/w8dEDCkQiK8wDKP3wEdvAt63OLNIVwPIC2jexTCSxJgX9X8jFlDBQ0wdlS?=
 =?us-ascii?Q?HyZfD2yqHTKsKz7eREA2NUsAsxeK2sgWRqlOtQk0yYi3h1hfEO3CIC82kFPk?=
 =?us-ascii?Q?TDmzxze856qqEUJCXTI+KCSAPlOtKqw9IDDHWKJU82pAC6Ks6k0khiDNDGNc?=
 =?us-ascii?Q?te9wFavyc6PSkDl+Bl9/FED1DZjiKPVqrloeADw+h66x8d/uOZDEfX0GbPy+?=
 =?us-ascii?Q?eLn7/QkuJ+8d5JFuFhM9Y9AHwyMXxr/siulwRsebU79ks95hCcnYIOC99BXa?=
 =?us-ascii?Q?7lv8hDzvE+GDAj8bBiS9qlcroWsmijf+0azz5I1ucuMpFKx/CYe9fVTQitXl?=
 =?us-ascii?Q?pMLmqu4HSV41dCh4Ymd6Ed3BjM7Ocs+zqdFxSjAsB630Y4O2fqDVMvu6Wk1q?=
 =?us-ascii?Q?XXPeQHDpcMK+4tOSTYA1yEStvP7EsPO7VGJoqs9reWIu9CnHD03p+diJjrOT?=
 =?us-ascii?Q?rOQdCC49r8kuPqybUrwTEHxqHoJvidGv4/530y4w43MrFPZ/GP5PlLuQdHz/?=
 =?us-ascii?Q?UEmYiGS4FW4wQq3iLXhEzm1WsMD8Yu3HSjbelFJfXYLxCYF9mvKwu3J2qnMp?=
 =?us-ascii?Q?xTOQDLkJhhm2U9D+zrqilE63eteE/DthDAdOY+4m3/Dt7ph0kzuISIAGC0yT?=
 =?us-ascii?Q?N755YyBao2nH7WRaY06rAIp4nFaGTJgbktq+LabtyUBrsd1X9ZOQdr0VLdaj?=
 =?us-ascii?Q?Xr5S9SbVED3T6Jwrxau4hg573Kn6fObbdHsf8HwQWchOGNA4agiroHnilV4S?=
 =?us-ascii?Q?9nvxyPICeR15dckoWxx/9sI3BesJxCKCai7LsThC9GcpHGS/K53K/G6/U8BM?=
 =?us-ascii?Q?fmaSpcwk4H17tl4a80R2xQYD0GcqSmq9yVtX9dhqMdbuoWRP3Udce/LBnXBW?=
 =?us-ascii?Q?9QfivA6fAnzr5EV61Aa2jsL9UkxrSOOTOTEVMvBK2jBcC0atDpNdCDuoNVe0?=
 =?us-ascii?Q?L4y7MWBngHIbBKgOSpz5YAeW?=
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR07MB2768.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bda3544-3356-4aa5-93ac-08d8f98ade24
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 06:03:29.5139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQT87Av9a6LonauQ5xVEZckuNUtcx0/9oT0KMzvVe6LudHMR9lLerjRyYeWXbcCY0ZQ2TchVPb+mMrN+2diEEBQQ6399TnP56Qah7udBXH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR07MB4012
X-Proofpoint-GUID: mRQJscMliHonHEV1FSiNHdahvzoLtwsw
X-Proofpoint-ORIG-GUID: mRQJscMliHonHEV1FSiNHdahvzoLtwsw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-07_03:2021-04-06,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070044
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 "nikhil.nd@ti.com" <nikhil.nd@ti.com>, Milind Parab <mparab@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for your comment and sorry for late response.

>> -    minItems: 1
>> -    maxItems: 2
>> +    minItems: 2
>> +    maxItems: 3
>
>1 entry was valid and now it is not? That's not a compatible change and
>needs an explanation at a minimum.

Yes, as the driver returns error in the absence of SAPB port address range, this
may break the driver on platform without SAPB port. This IP needs SAPB port
to support HDCP feature using embedded HDCP crypto module.

So, to maintain backward compatibility I will modify the driver and allow it
to proceed without HDCP feature, instead of returning an error, in case of no SAPB port.

Regards,
Parshuram Thombare


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
