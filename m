Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184B22B0107
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EAB6E1A3;
	Thu, 12 Nov 2020 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2771 seconds by postgrey-1.36 at gabe;
 Wed, 11 Nov 2020 17:51:21 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003386E059
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 17:51:21 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABGxvni025774; Wed, 11 Nov 2020 09:05:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=MRFEd+7ywotcUbp5XuLc7siOG/6GY+xeCieZQhb62WM=;
 b=ZZvPZUJYkkT/u2BdaKEbi1CGp5Yz6SmFD4GP01aKPKuYDC/tg2sFu3O5uS4EkSA3zfN1
 02O5A9fjKx1nkQr5xTS+MoiBXcbQqbsM6ctmXl1EVO52FE6AoMrGcHMmHlCz+i7Sg/kv
 Bpv+W+OCmZQXn2kFAQWDzil52aKVP9xtmHuUgnQvsCeeD3xDECqR8aY5p2KltTd5kgPV
 SC++L70vSAVWgAqq3rlemQfWvFLjCn/AEucggQapV7VcVJGmvNvg/6kEzkHmsthAk32A
 wTuyE9aHmcycROVRYXo3Vriah3SHjpxOqMaiSfM9CAzBgq6gI8/0+FwG2rp+ieREWLVr HQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0b-0014ca01.pphosted.com with ESMTP id 34nr231660-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 09:05:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcHR60Xrhxzto1Q9kj1ydP79JrZyEp1IDxBy5MwxWkgm/Runrk48y4XBU922jACNGApUWR1tsfBQpybAfhh5OuWd4VBxAlGX/kYnxtk99fdqH6mwOvf7aTkMAdUqR1qyLW2gwLw0xIMKBCoiGeFkKgyNPm5x/XVGfjlP/lo8N0T60mQl39f9Thw9MWJn3xmTXe73hSS0UZfMStW8g989Zu3fM3+1GcsWVVsAJ3avxYirvZGG7dVnTfp+lgKCY0Jok/gp9hz0M3egtQjFmBaLJhRZ4nBG2A2mEz8LVs4Egm31GCSYfUbqGglMFgCYDd3IrhHoBzRD1DK94pP0892/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRFEd+7ywotcUbp5XuLc7siOG/6GY+xeCieZQhb62WM=;
 b=YOUjDFUoITqdA5dBGLcqxc2Wxk0qyaygw6fddJovXqmqOQyo5S5n8Ab7U3tTTsu5B/dyMOqK2E2CObkeao/PRnVUzhQR5CbN9YqtUAF3B9lWxwRllpbMsMVc/GzvwgPv9Kj3fvxStG8esdzmv5dGJHky4Md/Gk6pfQiBFnol6UgO09c/re4VfOXQMKs3eYGP8mFwmUxs7tkEEwy8uYMFRFmAdEcet/sZlXOskAiF4dLlqMNnSGI9coI2klXddlSfXf8CCTVZheoXI3fY8CU8bRM1vLLj1z7kUYW+nDHq3K9N4BkDjhRDbP0sc1Cya6rV2vLRn9hhY3X3DSav0zYCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRFEd+7ywotcUbp5XuLc7siOG/6GY+xeCieZQhb62WM=;
 b=XIHWT2ip0dfLegn1l7hdjYZbxohdj+I/eJSOuJOkQlE4oCo3XnIHph0Vg5xLbf/CgDuZiKlJ3cwZb/Bx7ZIhkj/Ka8ajXODxGsc4tnFE4SJe9zUiaUCx308eoxEwRIXLetaesYwrkiaKNfmiY+xvrgwZzC5foFtufFgqqxuePXM=
Received: from DM6PR07MB6154.namprd07.prod.outlook.com (2603:10b6:5:17e::20)
 by DM5PR07MB3944.namprd07.prod.outlook.com (2603:10b6:4:b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Wed, 11 Nov
 2020 17:05:03 +0000
Received: from DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::34a3:dbd1:11d6:c303]) by DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::34a3:dbd1:11d6:c303%7]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 17:05:03 +0000
From: Swapnil Kashinath Jakhade <sjakhade@cadence.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: RE: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Thread-Topic: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Thread-Index: AQHWtrqv4FhYK94D70G2uDqcIgXGmanDKreQ
Date: Wed, 11 Nov 2020 17:05:02 +0000
Message-ID: <DM6PR07MB6154012F100782130E2D78A5C5E80@DM6PR07MB6154.namprd07.prod.outlook.com>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-7-nikhil.nd@ti.com>
In-Reply-To: <20201109170601.21557-7-nikhil.nd@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2pha2hhZGVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0wN2RjMDBiOC0yNDQwLTExZWItODUzNi1jOGY3NTA0NDIyZDhcYW1lLXRlc3RcMDdkYzAwYmEtMjQ0MC0xMWViLTg1MzYtYzhmNzUwNDQyMmQ4Ym9keS50eHQiIHN6PSIyOTI0IiB0PSIxMzI0OTU4NzkwMDM0NTE2ODMiIGg9Ijk2RkE4T1J6WmhkSCs4MVNrblZrbzJoSGRZUT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e13bd95b-f18a-4521-c924-08d88663ee63
x-ms-traffictypediagnostic: DM5PR07MB3944:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR07MB39447BFCF4CF32ED3FBFD2A0C5E80@DM5PR07MB3944.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zDqLN1yOWPVO6JEEsQClo279gf6zYmvlyyBJmvl65YJTbpAwlMMvd3aZXJGAdr/2U8OeYxcU3oZHV+eBqcBaMhRpSGEPnig6a25nTkmN+kbFZZ2pm7U66tsKZ5m0wmZqIfLSozr0/mvyViKB7ALNDhjP5aW9Mdj8igA4KEveWf5vTLtlTxHelOPXJnUth29hpuiPfrkvU0h1dBj3ekN+QYPKs7K5GOIkZ4C3JS7tANA+RvaUh2wSvT+9vo6xhvXJq1PkU8rC2A3QGJuQs8KQa0GW/VPRmhDQUal2alJPAEVouMrklAsCjAWBEZuclCL6M+G03eOti6vSXWaJocJxPF7RtZGVneBmeKQ4XCh7uLJb5D14QHi5WiyR90RfLkxI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB6154.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(36092001)(107886003)(83380400001)(71200400001)(2906002)(4326008)(66946007)(9686003)(8936002)(66446008)(66476007)(66556008)(64756008)(33656002)(76116006)(52536014)(55016002)(186003)(5660300002)(8676002)(110136005)(6506007)(53546011)(54906003)(86362001)(478600001)(316002)(7696005)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: yhA+38BdWquRjpSo9FScjb5gP+LM2SXMEfvCYLaG2EYilE2qeyJCr9FefR09FxGJjRpsTgxQEkaUnlpFR5m5JoZ6wsqye3eeA2yjoru3M2+FJTcHrrupmwF+vSGiycthrzYhhv+ar88E6rb2tYYJI0Oc1dZ7bjAViP8QuciqXKhM+LUabsUdRmv0qdCPBUpRwDZuT1fB3kZmdnsHB6VfW8at5Aa6GnvQgp0N8Uq92Q0Ko0ydhpLXyGDBqPwGEyywqwTshYUxxOZLQlFgwrr0EHu6NTfxN26O3wtYQmT8Eh8BaLliP9JOvSdtDrhOeF4rsbfNf9zo9hNoAhhbZfNArfYjJXIkM2pjQXkHo3xe1Tpg8punjDhS+eFe118lKBbvEDF+GPJ+aH+JyPcEGR3PgLnJ3hNVlfvw5tqOCQlGbfBYS7BhFWwZMNDm1lzMjl6fcVPFVjXJrYB9rIIeOT2C5uBpqvVoaKvtTjx2nIaOr9Y3xlFaILrOsnve9xw1x9ksw42CSv9+ZRWvLgk6IjjYqKCPFMyAu6km6V0e6loJwTewl6cXYoLZuFFNc47TLfd36de0WS/NNakzyk5zRtr7+B4E/rP7rpMvPUSP6f59aQ5uFKyeZRHzxGOhW8v/ExHqh0eSTF6/pXa2OY9LvQPJScQFyXB7NKrm5E6kvl3bRGUB3HlW1bnhHRa2SwGML+E753P29NoPkGxyDSJZkRQ8qR6PITJkeRgnUM/slAtWlL6/UNaOPs4NSygZOxTqk2aKTa2m5jz0lNP3z5M7r82XnU1Yzexk8wGaomROQ+/sixAAf4GrmfP1JcMtzcOfA5X/yw3b3rnbdtKAYyLBA9FJtpvA4IZ8SgBhxeXWM4uUn2zAdOF+iz8uIL0IA6kOLt7BaJD6ABKVZ6gdSpRN88/iAQ==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6154.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13bd95b-f18a-4521-c924-08d88663ee63
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 17:05:03.1177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7AoodP/ADsZb9zNlEW0cBxsAicWi5YAgWrj8xiU3vEo4m8QXBAFmrAgcKXNVa0SqzVNZ5U2NK90d8LztlKNgeJ+XU68t2ToJWfnhMms594=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3944
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_09:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxlogscore=997 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011110101
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Suresh Amonkar <yamonkar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikhil,

> -----Original Message-----
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> Sent: Monday, November 9, 2020 10:36 PM
> To: dri-devel@lists.freedesktop.org; Tomi Valkeinen
> <tomi.valkeinen@ti.com>
> Cc: Sekhar Nori <nsekhar@ti.com>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Swapnil Kashinath Jakhade
> <sjakhade@cadence.com>; Yuti Suresh Amonkar <yamonkar@cadence.com>
> Subject: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
> enable/disable
> 
> EXTERNAL MAIL
> 
> 
> When removing the tidss driver, there is a warning reported by kernel about
> an unhandled interrupt for mhdp driver.
> 
> [   43.238895] irq 31: nobody cared (try booting with the "irqpoll" option)
> ... [snipped backtrace]
> [   43.330735] handlers:
> [   43.333020] [<000000005367c4f9>] irq_default_primary_handler threaded
> [<000000007e02b601>]
> cdns_mhdp_irq_handler [cdns_mhdp8546]
> [   43.344607] Disabling IRQ #31
> 
> This happens because as part of cdns_mhdp_bridge_hpd_disable, driver
> tries to disable the interrupts. While disabling the SW_EVENT interrupts, it
> accidentally enables the MBOX interrupts, which are not handled by the
> driver.
> 
> Fix this with a read-modify-write to update only required bits.
> Do the same for enabling interrupts as well.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 2cd809eed827..6beccd2a408e 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2146,7 +2146,8 @@ static void cdns_mhdp_bridge_hpd_enable(struct
> drm_bridge *bridge)
> 
>  	/* Enable SW event interrupts */
>  	if (mhdp->bridge_attached)
> -		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
> +		       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);  }
> 
> @@ -2154,7 +2155,9 @@ static void cdns_mhdp_bridge_hpd_disable(struct
> drm_bridge *bridge)  {
>  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> 
> -	writel(CDNS_APB_INT_MASK_SW_EVENT_INT, mhdp->regs +
> CDNS_APB_INT_MASK);
> +	writel(readl(mhdp->regs + CDNS_APB_INT_MASK) |
> +	       CDNS_APB_INT_MASK_SW_EVENT_INT,
> +	       mhdp->regs + CDNS_APB_INT_MASK);
>  }
> 

Can we do similar change at other places in driver too?
Other than that:
Reviewed-by: Swapnil Jakhade <sjakhade@cadence.com>

Thanks & regards,
Swapnil

>  static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
