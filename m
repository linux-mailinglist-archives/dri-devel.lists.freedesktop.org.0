Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB9312A248
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A80789B42;
	Tue, 24 Dec 2019 14:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B268689FC5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 12:29:49 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBOCRwmD016101; Tue, 24 Dec 2019 04:29:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=Pe3XYDkeuXN8Pq9lro+ZrhrsBYl9iS25ZNNeq9BXAg0=;
 b=NW8OMOp78ZhBrKhVoVrGW0LBh9uPwftXDMLzcio5lebUntkxecs5ZzE2aM1Zs/ju8Akm
 b1v6+M5gjsTGW+wzIw+OB6tm62r2K3HvZ5/6YFlbgLuoHjAZcrZiILlaYdrHQO3SP8ZR
 9X+qJpBSF81VM07KdM1lBehPFexFoVvKfIsv9Bs+JvrJtazjvpZ/HvZWnwETC3F9+WRZ
 bw6cvp6ctJ7LqC2nWNEXi985UJmxqJS6n6tCxocE+lqbxRbqmIGpHUZzFGpM6veOVCEF
 ruOPUgYqhiUK9lMOq2H3ua93O7LIgRmrpFZokSs26ioQ8dv3AjHdFnpQd68lC3ugDPzK PA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2x1gu50611-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Dec 2019 04:29:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpOxRYpPE0W8M8M3JbOuNMR6URK3ApoS9f7WPaGPu62ZEcmUWddVcOQNmtUe50a+vqphJG+zjoHkhGJEa3hlIxmfEt0egLtkYBfx0qN1TNk5KmkgGNJV6QSZ7KjeSHwCIsmBWJWI7f2vKv9GJ8THy2HS5Vah7SXlGvlTJlQ5YkgGCaIIiD6UeF8uUhG2mEON5ITwV+Z+vcqtEyZeqceYDNeLBosDIavg1gkJwaG5hDNOOt+lmWB8d6WEohht3jyZuxfmxcDTQWzQsovveVnoEgOPSylbz145z24SDjgXnd4r1eun7HcI/1OmsbPlNv6coJLneUVqvGXT9q7jO27xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe3XYDkeuXN8Pq9lro+ZrhrsBYl9iS25ZNNeq9BXAg0=;
 b=SC0TL0ashuJH5X5bOez3BrvnApL9jPqKeQtt0H6YMbIIZcbxIRoeucegzZR4zsnC0uTemA58o7ygxNH/RlIC9nVui9i7qYMNwUjTKYnh0M2YrqDVgRBhCFflkNA1LbI/tCFONtlcKdI5I/1OnkKE+BxXXRoZwbr9V8iHUPo6JdTqu2AbBJAexABN5mqQ3cW+OkPPDk/macb/uzT5NBGV4Os8ExbJxrmYyut5ASyF50vhAQ1uJY3W3DImwBCwxwkUY6u0V6MntAHnDJdT9/KwYonNE1vnJefyc1UNi0otvVw8Ap8tN1aUvkICED86EUDkxJLbxuXhgxMETwkq1Zm50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe3XYDkeuXN8Pq9lro+ZrhrsBYl9iS25ZNNeq9BXAg0=;
 b=TW02clq0iNlX1chFCoEGRoxGGaJLJu2GCCSLLVZpxcKUXOI+WxxKkZZ/aNwvf/ZfOVC8sPAoVWLZVCYrl8yjKBtjMJRiD4Ai5dBNzqHbBis/YSAjL81JiFjoVzkhvFYdErQruIg2wcF1cqbew0MRveE3iVEdqXCqFhjRHBhZ2QY=
Received: from BYAPR07MB5110.namprd07.prod.outlook.com (20.176.255.14) by
 BYAPR07MB4728.namprd07.prod.outlook.com (52.135.202.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.15; Tue, 24 Dec 2019 12:29:40 +0000
Received: from BYAPR07MB5110.namprd07.prod.outlook.com
 ([fe80::e4c9:23b3:78c1:acdd]) by BYAPR07MB5110.namprd07.prod.outlook.com
 ([fe80::e4c9:23b3:78c1:acdd%6]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 12:29:40 +0000
From: Yuti Suresh Amonkar <yamonkar@cadence.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: RE: [PATCH v2] phy: Add DisplayPort configuration options
Thread-Topic: [PATCH v2] phy: Add DisplayPort configuration options
Thread-Index: AQHVuZarlyuLHgdLs0ymbXdtACZzt6fH9ueAgAE9e1A=
Date: Tue, 24 Dec 2019 12:29:40 +0000
Message-ID: <BYAPR07MB51108A47A453B456F5F0D233D2290@BYAPR07MB5110.namprd07.prod.outlook.com>
References: <1577108473-29294-1-git-send-email-yamonkar@cadence.com>
 <20191223171849.yvofolswgvyfklry@hendrix.home>
In-Reply-To: <20191223171849.yvofolswgvyfklry@hendrix.home>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNceWFtb25rYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0wYmYwZTMxZi0yNjQ5LTExZWEtYWU3My0xNGFiYzUzOWE4NjNcYW1lLXRlc3RcMGJmMGUzMjAtMjY0OS0xMWVhLWFlNzMtMTRhYmM1MzlhODYzYm9keS50eHQiIHN6PSI1NjUxIiB0PSIxMzIyMTY2NDE3NzM0NjkzMjgiIGg9IkZuYkg3TGlxUFhpU29XbkxXczl4VCtCcWJDVT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
x-originating-ip: [14.143.9.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57abde6d-9c1f-4172-ceb0-08d7886cf2a8
x-ms-traffictypediagnostic: BYAPR07MB4728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR07MB47282A37B1336FEC33F27611D2290@BYAPR07MB4728.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(36092001)(199004)(189003)(13464003)(66446008)(9686003)(2906002)(55016002)(86362001)(6916009)(7696005)(64756008)(76116006)(66476007)(66556008)(66946007)(55236004)(478600001)(71200400001)(33656002)(6506007)(53546011)(186003)(52536014)(316002)(26005)(4326008)(54906003)(8936002)(81166006)(81156014)(8676002)(966005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4728;
 H:BYAPR07MB5110.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6iI9wyAB7KTdt3DUMtw/74RZHrZx6R22IrwCp4FO2rmSLzWhSHKEvV1BXYkfOhOUOk1DoOEHgLt44G6O9GTOIm+n7RTuUEezv5R0dtq6+ea8tOnVJtJYGpMDb/8f+UaG0jb19B7bBG4xchLZinuZaSAlQbxnQUE8H7J5AAvl4MKDIII69meFT45zAx3i/X3ouJvTM6B8ax6A9fcH4E/3k+wqmxcTh0DMd7eItqkNXrTBqFc6oYedS87hk1IDEKh0MrtfReFyxJOVRW/W3Wo7lS2PEuASHXOM96RwXdFO4GzhV/FC/IDBKTiWnuc1Uup3bXi2rvGMFfc4I4DjC97joTjmASBB9xTvbv4OrwRIUUU3KlJFBZJfFY4UMETOf7KAmc0rkq070nMCaWfUzUWECFGeQbnw/sBHNk0oIXccoYIBg9n/4Rh+WJun8iBZ9/+UAHwgzdFDvekLanDkrovJ+DLrhFxEUKHlYtWX1qFTdiJmsxljxvEQHZ7p2TaKZhHDR4DUxbzE/xmdQjM3YXBByqayn/yOdXqaaWcXW9P926xwlL773bNrq4jYe+CPHlj1
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57abde6d-9c1f-4172-ceb0-08d7886cf2a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 12:29:40.2520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iL2d6qXZJ7X2Y0VAfpYDzwfAKNdpL5oLLKqBCJq86CmvDtoyVxisoS2SjT3UZ0oCc4HheX0z+lt6zwcpWfraYKKZM7/sJINX9l2aYaR84fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4728
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-24_03:2019-12-24,2019-12-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 spamscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912240110
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
> Sent: Monday, December 23, 2019 22:49
> To: Yuti Suresh Amonkar <yamonkar@cadence.com>
> Cc: linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org;
> praneeth@ti.com; tomi.valkeinen@ti.com; jsarha@ti.com; Milind Parab
> <mparab@cadence.com>; Swapnil Kashinath Jakhade
> <sjakhade@cadence.com>
> Subject: Re: [PATCH v2] phy: Add DisplayPort configuration options
> 
> EXTERNAL MAIL
> 
> 
> Hi,
> 
> Please note that I don't have access to the displayPort spec, so I'll only
> comment on the content of that patch, not whether it's complete or not.
> 
> On Mon, Dec 23, 2019 at 02:41:13PM +0100, Yuti Amonkar wrote:
> > Allow DisplayPort PHYs to be configured through the generic functions
> > through a custom structure added to the generic union.
> > The configuration structure is used for reconfiguration of DisplayPort
> > PHYs during link training operation.
> >
> > The parameters added here are the ones defined in the DisplayPort spec
> > 1.4 which include link rate, number of lanes, voltage swing and
> > pre-emphasis.
> >
> > Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> > ---
> >
> > This patch was a part of [1] series earlier but we think that it needs
> > to have a separate attention of the reviewers. Also as both [1] & [2]
> > are dependent on this patch, our sincere request to reviewers to have
> > a faster review of this patch.
> >
> > [1]
> >
> > https://lkml.org/lkml/2019/12/11/455
> >
> > [2]
> >
> > https://patchwork.kernel.org/cover/11271191/
> >
> >  include/linux/phy/phy-dp.h | 95
> ++++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/phy/phy.h    |  4 ++
> >  2 files changed, 99 insertions(+)
> >  create mode 100644 include/linux/phy/phy-dp.h
> >
> > diff --git a/include/linux/phy/phy-dp.h b/include/linux/phy/phy-dp.h
> > new file mode 100644 index 0000000..18cad23
> > --- /dev/null
> > +++ b/include/linux/phy/phy-dp.h
> > @@ -0,0 +1,95 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2019 Cadence Design Systems Inc.
> > + */
> > +
> > +#ifndef __PHY_DP_H_
> > +#define __PHY_DP_H_
> > +
> > +#include <linux/types.h>
> > +
> > +/**
> > + * struct phy_configure_opts_dp - DisplayPort PHY configuration set
> > + *
> > + * This structure is used to represent the configuration state of a
> > + * DisplayPort phy.
> > + */
> > +struct phy_configure_opts_dp {
> > +	/**
> > +	 * @link_rate:
> > +	 *
> > +	 * Link Rate, in Mb/s, of the main link.
> > +	 *
> > +	 * Allowed values: 1620, 2160, 2430, 2700, 3240, 4320, 5400, 8100
> Mb/s
> > +	 */
> > +	unsigned int link_rate;
> > +
> > +	/**
> > +	 * @lanes:
> > +	 *
> > +	 * Number of active, consecutive, data lanes, starting from
> > +	 * lane 0, used for the transmissions on main link.
> > +	 *
> > +	 * Allowed values: 1, 2, 4
> > +	 */
> > +	unsigned int lanes;
> > +
> > +	/**
> > +	 * @voltage:
> > +	 *
> > +	 * Voltage swing levels, as specified by DisplayPort specification,
> > +	 * to be used by particular lanes. One value per lane.
> > +	 * voltage[0] is for lane 0, voltage[1] is for lane 1, etc.
> > +	 *
> > +	 * Maximum value: 3
> > +	 */
> > +	unsigned int voltage[4];
> > +
> > +	/**
> > +	 * @pre:
> > +	 *
> > +	 * Pre-emphasis levels, as specified by DisplayPort specification, to be
> > +	 * used by particular lanes. One value per lane.
> > +	 *
> > +	 * Maximum value: 3
> > +	 */
> > +	unsigned int pre[4];
> > +
> > +	/**
> > +	 * @ssc:
> > +	 *
> > +	 * Flag indicating, whether or not to enable spread-spectrum
> clocking.
> > +	 *
> > +	 */
> > +	u8 ssc : 1;
> > +
> > +	/**
> > +	 * @set_rate:
> > +	 *
> > +	 * Flag indicating, whether or not reconfigure link rate and SSC to
> > +	 * requested values.
> > +	 *
> > +	 */
> > +	u8 set_rate : 1;
> > +
> > +	/**
> > +	 * @set_lanes:
> > +	 *
> > +	 * Flag indicating, whether or not reconfigure lane count to
> > +	 * requested value.
> > +	 *
> > +	 */
> > +	u8 set_lanes : 1;
> > +
> > +	/**
> > +	 * @set_voltages:
> > +	 *
> > +	 * Flag indicating, whether or not reconfigure voltage swing
> > +	 * and pre-emphasis to requested values. Only lanes specified
> > +	 * by "lanes" parameter will be affected.
> > +	 *
> > +	 */
> > +	u8 set_voltages : 1;
> 
> I'm not quite sure what these flags are supposed to be doing, or what use-
> cases they cover. The current API is using validate to make sure that we can
> have a handshake between the caller and its PHY and must never apply the
> configuration, and configure must always apply the configuration. These
> flags look redundant.
> 
> Maxime

These flags are used to reconfigure the link during the link training procedure as described in DisplayPort spec. In this procedure , we may need to configure only subset of parameters (VS, Pre-emphasis, link rate and num of lanes) depending on different phases. e.g. At one stage, we may need to configure only Voltage swing and Pre-emphasis keeping number of lanes and link rate intact(set_voltages=true), while at other stage, we may need to configure all parameters. We use the flags to determine which parameter is updated during link training. Using separate flags for this provides control to upper layer.
I am not sure how to use validate to achieve this. As per my understanding validate is used to verify if set of parameters can be handled by PHY.

Thanks & Regards,
Yuti Amonkar
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
