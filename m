Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B702AEA9B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8262489F99;
	Wed, 11 Nov 2020 07:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4450E89B68
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:32:58 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAEVlKm024050; Tue, 10 Nov 2020 06:32:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=QO77pSFnH2r8vPVoyChSArcl3H/VTSv/bAYVIW9vHDE=;
 b=HCciBqR/eDJ7q9RJoJ5stE80g0K+SLRkDAEFvLxoA3sATdwzUUYWIK0bo1dWq9SX0oIx
 3fdV8GiAIYUVmcqis7aVCyDfXgfwE9jYUsrBOdqCqzOndAbQot59+5w4tbXEsXleOLaS
 c9OwQ7ZnWp0LFWtTLsMK9w8UpP8ySvjdhyQlPtloKINOUap+h5PtyM0AaWBtAC9kCFrx
 yZv6hU0bhgsQRJ4W1OBKE8Tgvp0xAwvCK1bBqdiTK/bYaTRIWMsab91Fk39c2zKYA8Qs
 gz0ZJwXmbiRmlgAF9K+tnIe2AgcXTwnkgv8g+Ks/LhAi6BmqFLd0H5MghjRpV4lcyxkK DQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx0a-0014ca01.pphosted.com with ESMTP id 34ns14b09a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 06:32:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJCxxnx8AblM+iqBimRHex0TgYlGRcVzRb9lY+qAwwiebQNwT4F61U0aSYv94fyrNPbceXK7on9ZePbiF3/omt0T0wqQPTs1weMBAupLTu8PNJzPDC8b7GbNv5Ts5brxWi8fbyhkmJN8hjKaYlx/A94AQimnY7Byp3HOrGax3ls+eBNvZ1SQjcUSovlS07vFXIdQbpwL7Vt5x8TocG00Ix532e+hx92Z9Ym0Ddpu/5rEuHANGXkbRyPneNsLJROe1ngA5FMx3fjmg0RK3J/ny4p6ZI5LraHmxP39OFcnwiszSn7Rbh5Zmwec08JWVHf3EJmTJKafooga+q4SDW3byw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QO77pSFnH2r8vPVoyChSArcl3H/VTSv/bAYVIW9vHDE=;
 b=NfJXKzZleK4Ge0QnByI+/pFysEIcph/xsVumrDBuTqw82yFkp0nxiL8puMuSvKmCeqctguxzWBj6oYJiDt3BuuQn5+l9khSkeDm90D3IhctpmucfwNn9NSg7rzZyPXxS0bcxpYomJ8ioxgK5Tnn1jF4vCGGw9SdY0C02DbGOVxay9Hu14KMVUD8AHGZQ0Xi94RVMRx2OUUeooqyi9lqLdsl0rCySCieR4MSAh42VLtqfL4pFfiq25tbOuWB59ZwOHcKnPRFlCDMd3E2VXN2fDfVut8GrpMcg8YbT3+wlR63PVahniOTd9VG/c5R1PElUzaFPvLlwke6HnYADFejIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QO77pSFnH2r8vPVoyChSArcl3H/VTSv/bAYVIW9vHDE=;
 b=mImXlPvTZf+iL84/c+GIdjkLWddum1u0CuImzbwlgTzMhRujDW3oHHravnYKFo6BvBusn2dHnL7Rm+XLJizgmmjVjNDlXTa1pPmjfUywqPaSYEzaQjj267+oINqdrd1yk3z4ImI+MInIRX9vD5N8eyyWHd0LSC+RCUJ/MgQ/Vjs=
Received: from DM6PR07MB6154.namprd07.prod.outlook.com (2603:10b6:5:17e::20)
 by DM6PR07MB6155.namprd07.prod.outlook.com (2603:10b6:5:159::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 14:32:52 +0000
Received: from DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::34a3:dbd1:11d6:c303]) by DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::34a3:dbd1:11d6:c303%7]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 14:32:51 +0000
From: Swapnil Kashinath Jakhade <sjakhade@cadence.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>, Tomi Valkeinen
 <tomi.valkeinen@ti.com>, Yuti Suresh Amonkar <yamonkar@cadence.com>
Subject: RE: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Thread-Topic: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Thread-Index: AQHWtrqv4FhYK94D70G2uDqcIgXGmanBGC0AgAAShYCAACFvgIAAGBWAgAAKf1A=
Date: Tue, 10 Nov 2020 14:32:51 +0000
Message-ID: <DM6PR07MB61546E25F8FFFC4EF640962EC5E90@DM6PR07MB6154.namprd07.prod.outlook.com>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-7-nikhil.nd@ti.com>
 <1e434bb5-c027-792a-0c4d-c3cf057a0ec6@ti.com>
 <20201110102723.mgtrq5gznvvbpop2@NiksLab>
 <9d23f838-a9bc-ba5d-adfe-9b3bfc26c223@ti.com>
 <20201110135315.53ehiqmwunmwzhod@NiksLab>
In-Reply-To: <20201110135315.53ehiqmwunmwzhod@NiksLab>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2pha2hhZGVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy05OTZhNWY1ZS0yMzYxLTExZWItODUzNi1jOGY3NTA0NDIyZDhcYW1lLXRlc3RcOTk2YTVmNjAtMjM2MS0xMWViLTg1MzYtYzhmNzUwNDQyMmQ4Ym9keS50eHQiIHN6PSI0ODMxIiB0PSIxMzI0OTQ5MjM2Njc3MjY2MDAiIGg9IlNPM1A0UGo5bWMxZlJoV1ZDYjBpMEJQa1lPMD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0d540ab-2eb7-4475-4381-08d885858141
x-ms-traffictypediagnostic: DM6PR07MB6155:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR07MB61557DDF08A44C1399B8761CC5E90@DM6PR07MB6155.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JgXs4m2l/Pgq91v1FOhRqA2ocR0wpFq3KEMqTxMZKqGfB4dGsnD1XSGJusuhEhLspPgzSBDLChAUCJK083REuymo1XPwh8Ho1HfEjRCgJx2ymlszVtbEgIJnmwoLSVpxCohAII9MbGfuEIP39qvM/9LpcJBjxK4Pikrmuo3jQmQoYgi8RFrVEGp413dC/qigbWSeE4uTShV0f/Lasl0iHklhXgIdrwC/asBQFaieh/sZtIcw9iphke81jmPUXGoB2SxvwivPB+DYjeJyy38UZJbATcWJtbAvo+7C5uC5coaNEYL0zU+MixRYTWLAuQW3xr6mVWt19+UXhaaQVQVje2uAjGoecgc6LGvMFEY7p1UJsUGTYEGoZxN5N0WJkspz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB6154.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(36092001)(8936002)(26005)(6506007)(33656002)(76116006)(66556008)(52536014)(66946007)(53546011)(2906002)(7696005)(107886003)(64756008)(66476007)(66446008)(6636002)(478600001)(71200400001)(186003)(5660300002)(86362001)(316002)(4326008)(55016002)(9686003)(83380400001)(110136005)(54906003)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: DGWJBwIHrETutGvE0caSjtD3HBRhQ4yWvNVRagPYoBzclzQVMEH6gw7vvl8uDS6TKlefoz4EFskxEX4SnG0eKrXJPppOH2J48Bg6w0copAHqSO8v3sSaiC/vz8AzR8LJqYyLLIFZIdLh91IHeU51RWEe42aU982/olfZtpNqKHjeOPqkfYAqbbnx3MUVhrjfbCiBRNbvP+WVvReUICVgqZWbQhIyO8Q/hBrJzomGkHjTZ7eWM5pox2tts6MiEZAeR3mzhVBOrISrh8Cx3IgI/8SsI67Ae/KGSTvuOnIGqSe5E5eqGiZtAbczVYkXx1UJotagVoYwQtDFY4vEfM6wDPSJ9Mo5qD42x1/F0YOWCbUkaU90bXG6mf8dqV6Na+a74jyxu/ZZprfo1oByLVcmayq/cK/ah/9xh7DwrySUJtA5J/FEOrsYazoeQarNGlJGIRTnUqBlxzKvQ42yRsJcBEhwnqqwJOkQzy3i/BMLP8d6FgBQ9xk9UFKFb7pexbqj6xzNzpp13/KoZDrHkmDaGj5Bv1gBeDDxeU3zcrI2BNvZZWa+boK/ft4BqwAjIqI+50jiKf3mKS1op+r0UwfGLk5kkkrr7eVboTqj/gsP6hR8b5AdRzVtdmQ/BXyP4dVfKJ4pH4Q9L/0yYsxosRAW9nwUozRqLihH2DYMT8rwzu4YoTodegH27x0JeIAvUBi/AE3N+LVvgcVEOCA51/kXhD4k987zfpaJv1pZa+H3lwNcPZiMzclS6aKbz33YHsC3B7kHcow74vAXISrSQ1kQqZMGGDbpGA1I6/cAjVDWPQ6n8uVLZSq0XHnpwDmvlXPZVic4Os2CSIGksEsgZbntE6ogOW1gdAEdMDJ20UaUzWAUyhdh8JtGiHH98rKMxD+D9EpJrveLBKRJ96H6+WIWWw==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6154.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d540ab-2eb7-4475-4381-08d885858141
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 14:32:51.5769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsOqCmQ2xal4hwN+S6HsyO3uTpfmIHKGQc7BabNSyCaSCUJTNmgdGpyCnk5jmFouQ1IAiWzqdxwBrQMF/9hxc1ZTHK+EI8GA38TNFaNT22k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6155
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_05:2020-11-10,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011100105
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: Yuti Suresh Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> Sent: Tuesday, November 10, 2020 7:23 PM
> To: Tomi Valkeinen <tomi.valkeinen@ti.com>; Swapnil Kashinath Jakhade
> <sjakhade@cadence.com>; Yuti Suresh Amonkar <yamonkar@cadence.com>
> Cc: dri-devel@lists.freedesktop.org; Swapnil Kashinath Jakhade
> <sjakhade@cadence.com>; Sekhar Nori <nsekhar@ti.com>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Yuti Suresh Amonkar
> <yamonkar@cadence.com>
> Subject: Re: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
> enable/disable
> 
> EXTERNAL MAIL
> 
> 
> On 14:27-20201110, Tomi Valkeinen wrote:
> > On 10/11/2020 12:27, Nikhil Devshatwar wrote:
> > > On 11:21-20201110, Tomi Valkeinen wrote:
> > >> On 09/11/2020 19:06, Nikhil Devshatwar wrote:
> > >>> When removing the tidss driver, there is a warning reported by
> > >>> kernel about an unhandled interrupt for mhdp driver.
> > >>>
> > >>> [   43.238895] irq 31: nobody cared (try booting with the "irqpoll"
> option)
> > >>> ... [snipped backtrace]
> > >>> [   43.330735] handlers:
> > >>> [   43.333020] [<000000005367c4f9>] irq_default_primary_handler
> threaded [<000000007e02b601>]
> > >>> cdns_mhdp_irq_handler [cdns_mhdp8546]
> > >>> [   43.344607] Disabling IRQ #31
> > >>>
> > >>> This happens because as part of cdns_mhdp_bridge_hpd_disable,
> > >>> driver tries to disable the interrupts. While disabling the
> > >>> SW_EVENT interrupts, it accidentally enables the MBOX interrupts,
> > >>> which are not handled by the driver.
> > >>>
> > >>> Fix this with a read-modify-write to update only required bits.
> > >>> Do the same for enabling interrupts as well.
> > >>>
> > >>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > >>> ---
> > >>>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 7 +++++--
> > >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > >>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > >>> index 2cd809eed827..6beccd2a408e 100644
> > >>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > >>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > >>> @@ -2146,7 +2146,8 @@ static void
> > >>> cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
> > >>>
> > >>>  	/* Enable SW event interrupts */
> > >>>  	if (mhdp->bridge_attached)
> > >>> -		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> > >>> +		writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
> > >>> +		       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
> > >>>  		       mhdp->regs + CDNS_APB_INT_MASK);  }
> > >>>
> > >>> @@ -2154,7 +2155,9 @@ static void
> > >>> cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)  {
> > >>>  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > >>>
> > >>> -	writel(CDNS_APB_INT_MASK_SW_EVENT_INT, mhdp->regs +
> CDNS_APB_INT_MASK);
> > >>> +	writel(readl(mhdp->regs + CDNS_APB_INT_MASK) |
> > >>> +	       CDNS_APB_INT_MASK_SW_EVENT_INT,
> > >>> +	       mhdp->regs + CDNS_APB_INT_MASK);
> > >>>  }
> > >>>
> > >>>  static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
> > >>
> > >> Good catch. I wonder why we need the above functions... We already
> > >> enable and disable the interrupts when attaching/detaching the
> > >> driver. And I think we want to get the interrupt even if we won't report
> HPD (but I think we always do report it), as we need the interrupts to track
> the link status.
> > >>
> > >
> > > I read from the code that there is TODO for handling the mailbox
> > > interrupts in the driver. Once that is supported, you will be able
> > > to explictily enable/disable interrupts for SW_EVENTS (like hotplug)
> > > as well as mailbox events. This enabling specific bits in the
> > > interrupt status.
> >
> > But SW_EVENTS is not the same as HPD, at least in theory. If we
> > disable SW_EVENT_INT in hpd_disable(), we lose all SW_EVENT interrupts.
> 
> I am not sure, what exactly is covered in the SW events apart from the
> hotplug.
> 
> Swapnil, Yuti, Please fill in..

hpd_enable/hpd_disable callbacks were implemented as a part of supporting
DRM_BRIDGE_OP_HPD bridge operation. The existing implementation could
work with current features set supported by MHDP driver. But Tomi's point is
valid, as there are some HDCP interrupts which are part of SW_EVENT interrupts
and this might not be the control to just enable/disable HPD.

Swapnil

> 
> Nikhil D
> >
> >  Tomi
> >
> > --
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
