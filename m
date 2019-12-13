Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C3811F216
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CB36E34B;
	Sat, 14 Dec 2019 14:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD226E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 11:06:06 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBDB1wg6000540; Fri, 13 Dec 2019 03:06:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=/23mMUow4WBN3sMWudMMwQWgBTK0aGNmUDgN1LHNIIM=;
 b=KhyCLQQbZnSNx/NVe5mrXrE+nRxWJ2uzSHfY7rvyE55QmhB9K4gqvrOhSw6iEJaMi0wJ
 Bqd9PSrYsz9oFVv+gE3Jml+1UH5Zs/jM0SPzTwrqGYzgDmAZLQph141Dwf/u9i1ozmNd
 06xT5zcHw3POhm27FUBwz4NGPpAJWCyDxIBnM+ce0+GvyOWCCMlbgQjYbbKUj5O4cyZH
 dnLA96YpHdaA/73e8gsImV/SEmIchaA5hamVcihz8gg7XCq7hh4r3c4WXwVIq0goRm/P
 WgTgLgw9FncASRCuHwRa6oV/H7go+TKRc6pe6/bqDi8lG/Zp0sBqqQF/WfqMn4aJFtmA hw== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2056.outbound.protection.outlook.com [104.47.38.56])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra70p4a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2019 03:06:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSHFr0jqlI4yYDEq1zjbhDEtFBNlgeN5u+l6FVXIkrd9V/t4fPS8lYeBiqjzz7tGebGJeZDBUeIdM1UomPYn3D3Wu+DJm5KWLGFIZdnYupfVWOB7tuWYldQ9APoUIXnleyJTnSnpO2qWLAaePfCnflKkR1Bf6KsFGTIig+iFMKKz1bOtNGZ54GEgMc3CDinxTrYkBQbRzbPhhDLGGWWLu0hGQB2KxH3agowXxCs3ZcUNV5K5RmwxaE/2XUbbxCK902QCt/WlJwjcbM6iiSHc11ZuJCLaIURWW4F9Qkf3jHPeFd8zA7f+whd+6dup4Bgv84BQTk3f8d8Fz3iVOsC3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/23mMUow4WBN3sMWudMMwQWgBTK0aGNmUDgN1LHNIIM=;
 b=Dgkr7G++SIr/VsL52PeEdwb7jjli1EhGW6eaaTiiBIbLMMfTWuwp6bySSy2hhLWpDLmBTCsFbAFkPFGF4KyRvysagUB/GCB10RDuwELZUX2sp3aneI2Pba3qZZDZKsALnkJSwvbsYfGXzl3guuLH+1uM3Q3QMVWP+01rOW3nxX4rLpdwUPZhUV4/Kwm9z8RLrZt0JRI9BTQaWiylLVR8VAXGuIf6BidX8Zh9TTJxpp4PHXQKauUMXRRscCFGYX5/CElBsJMgFOAskgtN7eGKDcPkuk/YRINlsOmqzwIsUGfHqrPoIIx57AvtLWc0lT373Wv1U5q1d3Vny12LVj33cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/23mMUow4WBN3sMWudMMwQWgBTK0aGNmUDgN1LHNIIM=;
 b=jbq2v41tu4E00pXvEC6hSbvVXD4hHuwYhwsYnov/XFM98D/PyOe4mtErIDOtocWDrCAQJe573DfuG/i5tCOK9TQgUshb0m37NehKbxgLv9WLuuJp1CqTTLbUdFE6rvX2kJt8HlIoCk+RzOp5dBszQtNL2x/BhYgWnRtDXxnBi1E=
Received: from BYAPR07MB5110.namprd07.prod.outlook.com (20.176.255.14) by
 BYAPR07MB4759.namprd07.prod.outlook.com (52.135.204.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Fri, 13 Dec 2019 11:05:56 +0000
Received: from BYAPR07MB5110.namprd07.prod.outlook.com
 ([fe80::e4c9:23b3:78c1:acdd]) by BYAPR07MB5110.namprd07.prod.outlook.com
 ([fe80::e4c9:23b3:78c1:acdd%6]) with mapi id 15.20.2516.018; Fri, 13 Dec 2019
 11:05:56 +0000
From: Yuti Suresh Amonkar <yamonkar@cadence.com>
To: "maxime@cerno.tech" <maxime@cerno.tech>
Subject: RE: [PATCH v1 03/15] phy: cadence-dp: Rename to phy-cadence-torrent
Thread-Topic: [PATCH v1 03/15] phy: cadence-dp: Rename to phy-cadence-torrent
Thread-Index: AQHVqcJsdDBbWbqY5UGr0XLz42J8I6e348qAgAANiSA=
Date: Fri, 13 Dec 2019 11:05:56 +0000
Message-ID: <BYAPR07MB51104C210170FF41BF1098C4D2540@BYAPR07MB5110.namprd07.prod.outlook.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
 <1575368005-29797-4-git-send-email-yamonkar@cadence.com>
 <20191213095657.cia5cmcjopcxjyqo@gilmour.lan>
In-Reply-To: <20191213095657.cia5cmcjopcxjyqo@gilmour.lan>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNceWFtb25rYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy04NTk4NTJhZC0xZDk4LTExZWEtYWU3MS0xNGFiYzUzOWE4NjNcYW1lLXRlc3RcODU5ODUyYWUtMWQ5OC0xMWVhLWFlNzEtMTRhYmM1MzlhODYzYm9keS50eHQiIHN6PSIxMjUwIiB0PSIxMzIyMDcwODc1MTIzMjg3NDYiIGg9ImtHSjNyUGgzUExOdjhuK2hlZXdYWHFtOUUxRT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
x-originating-ip: [14.143.9.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db919ad8-655e-4431-b3e4-08d77fbc6dc7
x-ms-traffictypediagnostic: BYAPR07MB4759:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR07MB4759BE82420437A3E29FB05ED2540@BYAPR07MB4759.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(199004)(189003)(13464003)(36092001)(478600001)(7696005)(316002)(107886003)(4326008)(6506007)(53546011)(55236004)(186003)(4744005)(5660300002)(52536014)(8936002)(26005)(54906003)(86362001)(8676002)(81156014)(81166006)(76116006)(66946007)(71200400001)(6916009)(64756008)(66556008)(66476007)(66446008)(33656002)(55016002)(9686003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4759;
 H:BYAPR07MB5110.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2fC5nnrfwnVeDa/daSVUqe/YW57Ohycw2JZmcSVB7voUnnHfJLkWSa7/50ZbTZI+miODmqPEKaRNHAzdvwKrKlcn+CYIb/R0rw6g9n/5JAVe/8yQL1xK4nYRNzPzPH1uOdVZZGtSqFCs5Vv2zW5MYfY9tG/49mA1LbEXVQ89B9H0sp2yIl4qfk1W5zTEZ1ZW8Sv6YasNAAA/SVo5+0YLR9tEn58o0m7pFOp9kBa+awouuG+nPgjJIyhMn3U8KhleE94b+Smd/Jof3saHC84IdX8xCyb22d+6wZaGOlPaARsFdYsys7FU2R1uRWwu8yh+n1rqDx7wp8Mvo+l0wRkIVXA5Y0EpPiD6sAru9TZCDttRD1H2P8wAt1/0kdRnuzFMg9G+t48NFS3MspDe9TKCQth60D2FRxVHKcNe3WtRDTQaK3YWswt2YKmycpkvdP89IiECTIrE0xesOkp1sR9kaZz9QKmu48ipprulzsgvmyY1cgJdG2hYMRSsP4SyMOS5IglkiFcyZt+5SmDNLeDBVw==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db919ad8-655e-4431-b3e4-08d77fbc6dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 11:05:56.7218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OdS25nPryskdtu8hgge6UrJBlP0QKBt2wtBruoEbcEo1AMRG60l1AaWcV0VbKWNyd7oC7rXvsFU5VjMFZXuTrOqkql2jZuMbKEXP2BWcEPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4759
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-13_03:2019-12-13,2019-12-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=836
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912130089
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Milind Parab <mparab@cadence.com>, "praneeth@ti.com" <praneeth@ti.com>,
 Dhananjay Vilasrao Kangude <dkangude@cadence.com>,
 "jsarha@ti.com" <jsarha@ti.com>, "kishon@ti.com" <kishon@ti.com>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> -----Original Message-----
> From: Maxime Ripard <maxime@cerno.tech>
> Sent: Friday, December 13, 2019 15:27
> To: Yuti Suresh Amonkar <yamonkar@cadence.com>
> Cc: dri-devel@lists.freedesktop.org; Milind Parab <mparab@cadence.com>;
> praneeth@ti.com; Dhananjay Vilasrao Kangude <dkangude@cadence.com>;
> jsarha@ti.com; kishon@ti.com; tomi.valkeinen@ti.com; Swapnil Kashinath
> Jakhade <sjakhade@cadence.com>
> Subject: Re: [PATCH v1 03/15] phy: cadence-dp: Rename to phy-cadence-
> torrent
> 
> EXTERNAL MAIL
> 
> 
> Hi,
> 
> On Tue, Dec 03, 2019 at 11:13:13AM +0100, Yuti Amonkar wrote:
> > Rename Cadence DP PHY driver from phy-cadence-dp to
> > phy-cadence-torrent to make it more generic for future use. Modifiy
> > Makefile and Kconfig accordingly. Also, change driver compatible from
> > "cdns,dp-phy" to "cdns,torrent-phy".
> 
> You can't really do that though, this breaks any DT using the old compatible.
> 

This driver has never been functional, and there do not exist any active use case, and hence the compatible string has never been in any of the dt file.

> Maxime

Thanks & Regards,
Yuti Amonkar
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
