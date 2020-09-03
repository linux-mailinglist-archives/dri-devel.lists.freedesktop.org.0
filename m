Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F71125BDD2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C86E57E;
	Thu,  3 Sep 2020 08:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2751 seconds by postgrey-1.36 at gabe;
 Thu, 03 Sep 2020 07:08:55 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4756C6E18E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 07:08:55 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0836MsuI004793; Wed, 2 Sep 2020 23:22:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=hNnCNFDp/i1S9PNmYINicPJKhq681rs3elmbPfAnm4Q=;
 b=c2bOjkw0StCga4zuW50fF9dSbPLto0EtYikEOEey6awMr3mzXzxMdOASx+S0iTmLtg++
 kCvxAgPZqu7gs2YvoisWCySN0kEknPRMgbN9fl4Nm11NlUiNj7s9QEAtpPCGhslLjzBA
 zg0Z1ifBfByF54Fs8nXGRyZLCYS2MxZ9pDY+QtOtIjnhxEyqXc3svbniRUlYRrZWd2K4
 FIBKDXF7+G7ESzRHzOijmKZCkgZ78JniPcWZUoF807dGN1c5jrK0pyi2iGHVmUfCwjvY
 aL+9FSjHDpsqdOLbVx3JnNc28w1iEjkmFyMoyXArK7VOV8HGR+8Y8PID7dWpaOBD1iTK rg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by mx0a-0014ca01.pphosted.com with ESMTP id 337kjxuaac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 23:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMtlOpyR9e0REaPUFSHbVgUktmnB0lV1w2xsg/7zT7YY/e6lEnERYZ10siRnmIQNpyXvBwsf8FDcD7W9lI0/uZLU+WCa/2/NphOKprEKsvYYdJGhELXc4eLxITxt8NkdgP+0Bv3ziKrowuzu9k3Bzt6UqH37pgRbdOj/C+etex1fkVPbEVdgFzpDPX85nOI0qZ/waExmt1lyNUin9WCVlF1APO9IdY16P/q9qzWAQd9R+r/Kz4Z91FwYknGV1cjt45q5uEmMPUxGgoIFn8AL0y6BVah6MQkiTBHr2aDLv5X1qy+y5pP5RdQqy2sGCWxY6H+sXLnTZhkL4sivPS7ybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNnCNFDp/i1S9PNmYINicPJKhq681rs3elmbPfAnm4Q=;
 b=H7rLx+p111PYN1tGOYJkSSB8SsNbze/q3I1PrdtgZ+CZpmizkAn84twCCmac7UIRDQLB6xuYnbZeOB1x48biAbOgyQDDXYdxCjoalb8sPQLLafNbGsIl2xhxbzFS+8wIMBjQDzGUy3eCTfWzMDr3HxqCI7JZ+PK9gxNw1Q5WgzdaSe8B8niHfBxrFiPnX2w3+K6SL7S9ikK4gQnIyTYetz+vWSx2wYDFWH0tsiA3FQ9gkaRyiadh5zlgN0j3Iqo8SaJHN9DfS17x4ub7KfgwwS1d21RvJSEmKd55VKC00Md9tGtu94EA/gZlfd7+d5xPUAnWFHpLgMg29jfKWIatJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNnCNFDp/i1S9PNmYINicPJKhq681rs3elmbPfAnm4Q=;
 b=HCegChiVXrcgFsAU+O2/GW3bGo5gnl/r3zGpXiuguPDA/AdnEmxLDyanoJeGcsmrxz4Jf8wY15KL/yqdsTvpBpfIgqfVgaZ4tHn5D2EXV/8x/BfO7Gb/NMAcglmR4HaNNNUKJ/RDlMkpmKmn9D/aZzThjDhsTTeR/YGaDBx0dj0=
Received: from DM6PR07MB5531.namprd07.prod.outlook.com (2603:10b6:5:76::15) by
 DM6PR07MB7033.namprd07.prod.outlook.com (2603:10b6:5:1ef::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16; Thu, 3 Sep 2020 06:22:46 +0000
Received: from DM6PR07MB5531.namprd07.prod.outlook.com
 ([fe80::c451:7f79:5f49:d9f2]) by DM6PR07MB5531.namprd07.prod.outlook.com
 ([fe80::c451:7f79:5f49:d9f2%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 06:22:46 +0000
From: Milind Parab <mparab@cadence.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Swapnil Kashinath Jakhade
 <sjakhade@cadence.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
 DPI/DP bridge
Thread-Topic: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
 DPI/DP bridge
Thread-Index: AQHWf3AYzpzGkoZ9706j21VgVUJ0X6lTdp2AgALthcA=
Date: Thu, 3 Sep 2020 06:22:46 +0000
Message-ID: <DM6PR07MB5531DF749C993423B0A3E746D32C0@DM6PR07MB5531.namprd07.prod.outlook.com>
References: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
 <1598862215-10222-3-git-send-email-sjakhade@cadence.com>
 <e53e87b0-7e0a-763f-8b8b-0dc278e1f225@ti.com>
In-Reply-To: <e53e87b0-7e0a-763f-8b8b-0dc278e1f225@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [14.142.6.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff76b2dc-d533-4055-4ea9-08d84fd1c65a
x-ms-traffictypediagnostic: DM6PR07MB7033:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR07MB70334036E652E0F702B2A1A2D32C0@DM6PR07MB7033.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xChZ2mJt/uieclQ4hMkm7MES6zg6IvMw+UB/QgUz7d0BVLYf0lxxYj84xVrvRXlr4rS1VEWxC3583pprPA+FPorrElecyalfSLNaNGlep0P7UV6s4EEkHK9j9R4ZGTi3pdLv9TJdAgHF5f8di+Tc1EZlQ/laCE3CfQBVLSgHNzIq+TgkYCLDd/42IE+/noE3Ii+3+wrnbMHRyqWc/Y29lrmHKgacd4N4u8C/A/15UYRg0RivPx2Ai5tbTiwwGBVAlpbtgwopFl+Oys4+2wxfsKnwg/3ft9upqszbB1ROo9quNZokFMjycfhlq+ZPB1Yh2yZq5CbPndOiStynEJPtpisrGSC6nccMpbmeexbQfN8eSFBJf1nAS7I3HwMuG5fXpqbbtTEbRp7HzZ8fkkeM8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB5531.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(36092001)(2906002)(55016002)(71200400001)(5660300002)(33656002)(76116006)(4326008)(86362001)(55236004)(66446008)(7696005)(7416002)(64756008)(66476007)(66556008)(83380400001)(66946007)(6506007)(52536014)(8936002)(478600001)(26005)(54906003)(316002)(9686003)(110136005)(8676002)(186003)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9Cdq0c44vA56mJ/qgoxjtTYg7NKOo/ywyJEsewdj9d+Ayof1oMT1D2XZHxvGirSE4j3tDNBeZpPY1MIxE0oflZhB2ZQgC04DAd4AOapnf3uAZT5fKjKjNk+FueOUjhX74gn8MCK1M0Ifbwl2fdOIJcRnss/yyUg+UT5k8ycUD4uS711/NH1hFYMcX9ip1W5kDtwxnFimtOiog1Oy+DK8YhS4kqM1ttMbwMyz3ai1JHis6nDmRc/3B/V5w7mhgpsx54CowU76KuJXMrzV/jX0hf/FEow7pyud++Sg9npJKpw8hsc/GOyR/EU7v7rdmtzKQmf2ILRzRm5HH8N9+IxDp1PWsVCO+04kgUMlPiyz+Y9mF5VPJM9xc4AAQNUNeRGlCpKKwSmuWRpw+2jGyH/sGZKoNygf0V4sMaN6kzGud5eqPTjMYMQQIYY6Mpylfdwhyy/lSv0pYa8ig5hKXD6yP2vQM0ry5riM/S8ULZbP9m3mzENzKJzLAgOO5OIMyYDrb6mSLvKmosY2zs5r5tC6GZuFtZ1G6eZ/3h5M+BFQO91HrmAK9kw4dHR8+peOU17upEPMU1wgWr9+tVchIZSY22YL6KDHzx0FyxF0sGa25BXm1y0BU7QsDi2RqVanlBH/1UqbvPfYk6/tFypMSmN8xg==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5531.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff76b2dc-d533-4055-4ea9-08d84fd1c65a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 06:22:46.6871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T7C2Qyu4sNW/lSDNdEpUDM/cghEFBB1UeVmXHBVJaA0CknrHMVhBvapLAg4rLS06ma+Wt45khsaAYGI9n+X4+W8WVxkQBXX6xXAkFXYGED8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB7033
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-03_03:2020-09-02,
 2020-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009030057
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: "praneeth@ti.com" <praneeth@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>,
 "jsarha@ti.com" <jsarha@ti.com>, Yuti Suresh Amonkar <yamonkar@cadence.com>,
 "nikhil.nd@ti.com" <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

>-----Original Message-----
>From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>Sent: Tuesday, September 1, 2020 2:05 PM
>To: Swapnil Kashinath Jakhade <sjakhade@cadence.com>; airlied@linux.ie;
>daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com; robh+dt@kernel.org;
>a.hajda@samsung.com; narmstrong@baylibre.com; jonas@kwiboo.se;
>jernej.skrabec@siol.net; dri-devel@lists.freedesktop.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
>Cc: Milind Parab <mparab@cadence.com>; Yuti Suresh Amonkar
><yamonkar@cadence.com>; jsarha@ti.com; nsekhar@ti.com;
>praneeth@ti.com; nikhil.nd@ti.com
>Subject: Re: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
>DPI/DP bridge
>
>EXTERNAL MAIL
>
>
>Hi Swapnil,
>
>On 31/08/2020 11:23, Swapnil Jakhade wrote:
>
>> +	line_thresh1 = ((vs + 1) << 5) * 8 / bpp;
>> +	line_thresh2 = (pxlclock << 5) / 1000 / rate * (vs + 1) - (1 << 5);
>> +	line_thresh = line_thresh1 - line_thresh2 / mhdp->link.num_lanes;
>> +	line_thresh = (line_thresh >> 5) + 2;
>
>These calculations do not seem to go correctly. There's no comment what's
>the logic here, but e.g.
>for 640x480 (pxlclock 31500) with 1.62Gbps link, I get vs=4, and then the
>second line above comes to:
>
>(31500 << 5) / 1000 / 162 * (4+1) - (1<<5) = -0.8888888888888893
>
>The result is line_thresh of 100663299.
>

Yes, there is a mistake in the above equations. I will detailed it here
Before that there are other related issues which also needs clarification

First is about the TU_SIZE.
The DP spec says, in SST mode the TU_SIZE can take any even value from 32 to 64.
The advantages of having a smaller TU size is not explicitly mentioned, however logically it helps stream down-spreading and would be beneficial in low bandwidth low buffer applications.
Hence, we can consider that selecting a lower TU size is an optimization we can consider implementing later.
For now let us fix TU_SIZE = 64

Second, is Valid Symbol Length "vs"
For a fixed TU valid symbol length will depend in the Ratio or Pixel clock and Link symbol Rate (lanes * rate)
vs = 64 * required_bandwidth  / available_bandwidth

Where, 
required_bandwidth = pxlclock * (bpp/8)
available_bandwidth = mhdp->link.num_lanes * mhdp->link.rate

Also, note that CDNS MHDP implements DP_FRAMER_TU_p where bits 5:0 is tu_valid_symbols. So max programmable value is 63.
Register document gives following explanation 
"Number of valid symbols per Transfer Unit (TU). Rounded down to lower integer value (Allowed values are 1 to (TU_size-1)"

So, it says in case vs calculates to 64 (where Avail BW and Req BW are same) we program tu_valid_symbols = 63

Third, is about the line_threshold calculation
Unlike TU_SIZE and Valid_Symbols, line_threshold is implementation dependent

CDNS MHDP register specs gives the definition as " Video FIFO latency threshold" 
Bits 5:0, Name "cfg_active_line_tresh", Description "Video Fifo Latency threshold. Defines the number of FIFO rows before reading starts. This setting depends on the transmitted video format and link rate."

This parameter is the Threshold of the FIFO. For optimal performance (considering equal write and read clock) we normally put the threshold in the mid of the FIFO.
Hence the reset value is fixed as 32.
Since symbol FIFO is accessed by Pxl clock and Symbol Link Clock the Threshold is set to a value which is dependent on the ratio of these clocks

line_threshold = full_fifo - fifo_ratio_due_to_clock_diff + 2
where,
full_fifo = (vs+1) * (8/bpp)
fifo_ratio_due_to_clock_diff = ((vs+1) * pxlclock/mhdp->link.rate - 1) / mhdp->link.num_lanes 

Note that line_threshold can take a max value of 63


> Tomi
>
>--
>Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
