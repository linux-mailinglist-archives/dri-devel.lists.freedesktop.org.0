Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE627A838
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D9E6E3EE;
	Mon, 28 Sep 2020 07:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (unknown [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956F2891C2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 10:04:11 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08PA1n4f015632; Fri, 25 Sep 2020 03:03:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=ddcCiNx0N2s2W77aYKZCee9b68X562uVfsx3I96221w=;
 b=jzFi0SGxDWKZh5txPJBt0UFVggY6KbuCW68TbKmCmRQBeUj5vQ/1KSJtM8qLm1xTJ6th
 oiiw0xobgR26/rlXvu96512tpUccVrr0+aIFZQgL7UEvTO7OY7J5aTTaqGRYOJn46YAH
 BNOOmAyC2IomdO/VvC07S8Yl7MR+fsWzO4S6Wr1ap8LNMXe5/7BXBu3YsWxc8dAwUiEg
 beQKULMvGIc8uw6F+LDF+pOElZqGBtdQvnFaPptY122fA1kbHXy3vbkr9CSZRf/bKUSW
 lTYM1i1Mh6+/JdKRNsmRHqO/PUwEu9QjXBcRDE9OA8mbFlYRs2whD618aelc/QgtPFFd Vg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2053.outbound.protection.outlook.com [104.47.36.53])
 by mx0a-0014ca01.pphosted.com with ESMTP id 33nehy5ufu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 03:03:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYR9wjoscM3/zmr5B68kgdFh5UNQI2Wgg/GwM9gItfHxP69bJgLrBZimCoJlC8JqUprRnlWrMdsaVWPBhCheSDtPtlchZbuD0kzz/jlTMNhIMSCsLsQUYbereJF7wkEXtTpZni2xz/pYRSLywBj/3sZNr+879ql8mWpFoHeSq08LKidIGyLt56yMc1Yzl9b0DFWsCfP2G5QNPVEZMLae4nFc1xRvYGokfFNIPgGkjhnVe0vshwQ0Wrx2idNLIaPGw+pzHVMrzEXz72vWZigE43xSvi8ku+AiBrZgr4L5xZFrSAHv11PSOk+vhjZzErheUzVUG+oDJ5Vd+1p3fW0Jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddcCiNx0N2s2W77aYKZCee9b68X562uVfsx3I96221w=;
 b=XOU5KxYM0MC8AehcP23077JXU3TmN9Bqg/QJWEFqV7CPMoK+KrJ5iVYMlj/cO5SrlsryC6KkcFhEnRTYg0xFjCI/5idD3oJTgZ44tL1HK5PzSq07ReFgMOLUz9Ojn8xkNeLjEKJFEFk1n3cnETLdbMG3CkXC5ZNAYQ30kPEB3w3t091JsvrAnCyde/CVtffHUT9oG8uQOLqNhABJTaI8o630rJ2JAncIuMD2UoBglL73ftySaXNhdSij6BGFpDzgt7fq8kmyb3b/c1tTIcVMYKfurDfNzRwkFp22G8yUHYftNY6YkEiD2Cm6Go1GQrmQmO8SjfB0gwRwO3P84oXWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddcCiNx0N2s2W77aYKZCee9b68X562uVfsx3I96221w=;
 b=ZDS5dmblzwUvtnD5nIOFul5KGefhBScO239V7jHzcaVeJmnoNCYmezPK42Fqx7KY4LNWU1InQXzLOR7TJqWIA2acYDxJe3ePPiiQbqH+ESeIso+bOU1aG3mrnpLxRSGpBWQGwCWLs7IPQ+WIQizXNBLhBsk/lBGwjE06tblFU4I=
Received: from DM6PR07MB6154.namprd07.prod.outlook.com (2603:10b6:5:17e::20)
 by DM6PR07MB6923.namprd07.prod.outlook.com (2603:10b6:5:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Fri, 25 Sep
 2020 10:03:40 +0000
Received: from DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::34a3:dbd1:11d6:c303]) by DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::34a3:dbd1:11d6:c303%7]) with mapi id 15.20.3412.023; Fri, 25 Sep 2020
 10:03:40 +0000
From: Swapnil Kashinath Jakhade <sjakhade@cadence.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 Yuti Suresh Amonkar <yamonkar@cadence.com>
Subject: RE: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
Thread-Topic: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
Thread-Index: AQHWkYPrcyLSJFiTg0avExX8dIrr2al5IgFA
Date: Fri, 25 Sep 2020 10:03:40 +0000
Message-ID: <DM6PR07MB61541F094CA37FDB69D2C68AC5360@DM6PR07MB6154.namprd07.prod.outlook.com>
References: <20200923083057.113367-1-tomi.valkeinen@ti.com>
In-Reply-To: <20200923083057.113367-1-tomi.valkeinen@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2pha2hhZGVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy01ZmU0ZjlkOS1mZjE2LTExZWEtODUyZi1jOGY3NTA0NDIyZDhcYW1lLXRlc3RcNWZlNGY5ZGItZmYxNi0xMWVhLTg1MmYtYzhmNzUwNDQyMmQ4Ym9keS50eHQiIHN6PSIyNzE2IiB0PSIxMzI0NTUwMTgxNjE1ODA3NjIiIGg9InBRUVpqYmMyUG8zMUNoQWdTVm9BK0FHMVAyRT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cac49ce3-e1a8-4c92-ee1a-08d8613a4796
x-ms-traffictypediagnostic: DM6PR07MB6923:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR07MB6923D97244101D8D62647151C5360@DM6PR07MB6923.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RblpcAFcpdOLaXkK7JdGjwn5jc0OEZ/W+rODaVDGtdPAuckeBneeHD8AToigW8g11TRZ+aUMfdfNdbWHbzS0t8WRpY6BgO7dkv0Cld0u6iAYStil4ZWShCjZzj1XIoCcvBawcBJQI5sHJdbWpnsxwRN7Hvl7iMafesf9xKtjaJJc7ohnKQL+UGIYKh9Xo2mn0RmRQpLYGmeHrC2SCQoyGB6Zqh61g7uuFjtDpALedWh81eqRfGK2u+j+xIwuzZta3w6AtAVdyYhumNavpy7tOhYS5KAu8QURreuD7rVI8w+1Muq7CMtMzMYh27rFG9Vmtcxsqyg/2p6vvGyoITNSu+w3UW+dGa0Af68S2yqp1vJqrOdZ3iNTVpPbYBZHwbXL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB6154.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(36092001)(6506007)(53546011)(26005)(478600001)(55016002)(9686003)(2906002)(83380400001)(6636002)(4326008)(66556008)(66476007)(66946007)(186003)(64756008)(316002)(5660300002)(52536014)(110136005)(8676002)(7696005)(33656002)(66446008)(71200400001)(86362001)(54906003)(76116006)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: z8SR3qFrsKu2gerKj7YJq8prBFpearfinvuvKSROvsSG0h/wW4D3NEVaz1LpG/ST7S+mxru1MOlHmQkjXd2DL8jbK2HkWE/fbZqAzPXjTS9SzubhFF2qeYhGA2Ru8Ed7OO7PtbaQb+6R5Y0gy5LtZ+pfkJg/Vr1Kk5ZgE6Zi7ACmTUG89HARF6wb3pI6OrtUuIQ9VQlpeAHROkGhQQ1R1AmUhd/0M5dNYHKc4dD/nWpzDel+yaIid/K/axGIjITRIUek3+spVb9fh59hHUiATsUuwv8u/rrHkOchyVVys38obGG0Ug+OUmkifT6qxblvr7j82DDBQ9yQGqhsERMuS65hqsqA5C+QFx4bF/1t5alDlZ901s1j70wDBihyDDUTFI4rXt608pxv5hbYiWW1mGThF/eW3MSKEjJ1dgeNT0QAXvftL693muQfccXeBmCBiOvifPcSuYa/Cd9VP6qDEwm2XOzAPhNFicpHwNc4wQ8djdbEQPjG7rmiGaTS8eGruXIVnKHSSt7rtBYh+e+LPjwTdmYuFNn+C7pztuygudDOlAOoNE/7k/fE0e659CX0kRQ6OOR54sZ579RyL/M4tB5P5GCcWJaLct9i7ivAdSdKsiA39eQ7Xh37HVxA/F3hOy5inRvz94zWzl93FhAuyg==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6154.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac49ce3-e1a8-4c92-ee1a-08d8613a4796
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2020 10:03:40.7877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mbn7z0qmLJl9IM0eYCHxrd/pJKueCs8lS8+2Peacm51ICNsTrTc2517rlP7pvkqJd/cmWHiWL7bvJ8Kppqf6XdYGRoiAHm2wsf07oA3FWLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6923
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-25_04:2020-09-24,
 2020-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 impostorscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009250068
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

> -----Original Message-----
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Sent: Wednesday, September 23, 2020 2:01 PM
> To: dri-devel@lists.freedesktop.org; Swapnil Kashinath Jakhade
> <sjakhade@cadence.com>; Yuti Suresh Amonkar <yamonkar@cadence.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>; Dave Airlie
> <airlied@linux.ie>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>;
> Tomi Valkeinen <tomi.valkeinen@ti.com>
> Subject: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
> 
> EXTERNAL MAIL
> 
> 
> On x64 we get:
> 
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning:
> conversion from 'long unsigned int' to 'unsigned int' changes value from
> '18446744073709551613' to '4294967293' [-Woverflow]
> 
> The registers are 32 bit, so fix by casting to u32.
> 
> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546
> DPI/DP bridge")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 621ebdbff8a3..d0c65610ebb5 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -748,7 +748,7 @@ static int cdns_mhdp_fw_activate(const struct
> firmware *fw,
>  	 * bridge should already be detached.
>  	 */
>  	if (mhdp->bridge_attached)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
> 
>  	spin_unlock(&mhdp->start_lock);
> @@ -1689,7 +1689,7 @@ static int cdns_mhdp_attach(struct drm_bridge
> *bridge,
> 
>  	/* Enable SW event interrupts */
>  	if (hw_ready)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
> 
>  	return 0;
> @@ -2122,7 +2122,7 @@ static void cdns_mhdp_bridge_hpd_enable(struct
> drm_bridge *bridge)
> 
>  	/* Enable SW event interrupts */
>  	if (mhdp->bridge_attached)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);  }
> 

Reviewed-by: Swapnil Jakhade <sjakhade@cadence.com>

Thanks,
Swapnil
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
