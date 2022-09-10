Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032175B4737
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 17:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEB910E1E8;
	Sat, 10 Sep 2022 15:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eastus2azlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B557410E1E8
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 15:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evyuA2ND/Vt+2G9p+WdpwBtMVv0ZkC+XBvDJY1D3unnPkZp8ajTjAOVOR/pTo+bPlRtkKgniPjyH/3WIA05CgPCVvrHmd+VtQ8c2o2BvZihUty7Fl4tkj5g5QFKBEGmgxaL9kvw4xmSP5C+qTe9K+5AB5EK0ScOCuIPFeqQg0Znx4m1SGrYZoqR4nlDIJIpL6zZmF3WvFhKyIVqmqF0HtW6KUq9gfFVEihdNNSkfz/nVfm6t9sqIDRC3cjScNwRKnlhTbWeUSvN9gVl8LbFVMhIDxf/YtsL5itnVvPv6yvLIiXMBmveh0iuEtvc04WJXT1ACNzP+BvPjBocFrvZy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BshESlLrosbdubz1IzTKBHaq5FeSPdpMjrhDEZLrLf0=;
 b=g2coQSZUcrkaBVgQPjZwXzk5iggEvoGbAwsLYHGuxiy3ylJshIpjKknZg86fXBo8H8dpukSKjvR3ruWOwBuLAkFIndAZVXxsupvDiu/m3aqNvLWg4+pSjMoO2Jsua5chg/HSKWSs16ttX6FRRLwcR02WGDNXHAj6wWSnLrvniUDFiSOovVC1nbAgytWq/pXgmBWhQfO+dxEJnMrPzVWkUSRgpFHQaxXZPcnEt3Ahi5jnoIQxGgat9v5n9QphFtMMICkbQ2mck5R1CYIN3eDYZnmD6uvA29zs+0A1FyuH37xjCjmHd8GTQ2pgIJ5oUmACXa5Ae7Z4BnqZlsuSZO0cNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BshESlLrosbdubz1IzTKBHaq5FeSPdpMjrhDEZLrLf0=;
 b=FR1LK1ErvQwf26hZNUya+3YlpIM6Ftyzx32l+uKtvw1BZC5eKZeYBwa9QXOxzjrA+AoqtuZWDDUJaEHJALnTDia+0r8L8mvBVcD0nCSfxK0oTFRaB+RHBP4vMafY9ClNCnF4l6oK4KIu3atIuEAcPhr2r4WD2GxOzeLD1giZDF8=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by DS7PR21MB3078.namprd21.prod.outlook.com (2603:10b6:8:72::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.4; Sat, 10 Sep
 2022 15:07:38 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::17f5:70e:721f:df7e]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::17f5:70e:721f:df7e%4]) with mapi id 15.20.5632.011; Sat, 10 Sep 2022
 15:07:38 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, Saurabh Singh Sengar
 <ssengar@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/hyperv: Add ratelimit on error message
Thread-Topic: [PATCH] drm/hyperv: Add ratelimit on error message
Thread-Index: AQHYxF5CVv3MPk3FdEq1sLG/q/h+I63YxQKA
Date: Sat, 10 Sep 2022 15:07:38 +0000
Message-ID: <BYAPR21MB1688D5F0EF3322ECE6CB835BD7429@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <1662736193-31379-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1662736193-31379-1-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=99d666d9-22a7-4b32-8d03-80f6c57f16cf;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-09-10T15:06:15Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|DS7PR21MB3078:EE_
x-ms-office365-filtering-correlation-id: 04e8ba0e-3d98-4336-9ed2-08da933e338e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xzv6XVcbrccef01DJqJYW43/8WNP4Kr1dHscJq8mxJzcCuBd3buw+OylUMLeWvSvxQKCEqJZ8zrg9YE2JBeAsgHQk5YAlqoGKClSokxfhsa6Ia6lfSg5vTO+cfY/mZERT/BCM2ZECw1xBHrhjkLJQI8UPICirHbcEiEugoBbzGBDKn2QCes/wu/YlCfDSz3oX7W7YBVHfW+yxgJKmxE4SdvMXdwlMMaGkPN4J1zYxPB8LqW3frNiouNppzbqLcn4vBXWqqKuq/JuO5izOookif8b6VvOp7sCaZaPLS74sbIBy1s5TO58uWcnQcROmt5hVsdJDtCoGUra6v13TBy2z34MFKlWv0DPbAMYUlpxZzlSP4OK99CilkXCewGlJgNYOU9kC9XE6z5dk5wf1LZIsm7au81HiRlgyZU8L+Dqv8+HOt3kL5mdGdNU3x6ArZ3yEYUKWZXhi2TMoMDSQ2O2NzrUKEG0nanhMjqcICxS8WVv8oQmxghvB8JKzbai7ddycq8hJ6mwSn+59drPjUSP8sAKxlsMvVHlxp74ynlHSg8fLwPUICYfLX8YF4itZCWLc5ItQIkmtdcvYLtlfJFdFFcbwB3lMFqXDilMH0Okg/Pc8Db7gvvfloZoym5CiUZ23QCUMu1BF7ltioyyN8qCOUmzHwewLtdSZfnxwp8u9FzegbN5pzZsSUIsEmXpNyzlmauOY+xcc1GQNKghq3UL02OtDmVc9pwCoMIl/+bWw5PrIWqi0NphM/8ac4BUcc7XIdJ1yqc/v48ev4vyFmsK+gBO19wh/DbEL7yOI7CkKbNtSC34EhzI+VW34g++/PeD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1688.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199009)(64756008)(8990500004)(8936002)(66476007)(5660300002)(110136005)(316002)(66946007)(66556008)(76116006)(8676002)(33656002)(10290500003)(55016003)(9686003)(66446008)(71200400001)(26005)(2906002)(6506007)(15650500001)(7696005)(52536014)(478600001)(41300700001)(82950400001)(186003)(122000001)(83380400001)(38070700005)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wpyYqT6XVrCDbNlV3mNCPsCb2MU54GkJYWyzlOaBT2Y/TWVwJloCOXZx2mus?=
 =?us-ascii?Q?5Wk2XmtS8NK3/Zk/W4WhKK3vAPZ5gAzRDEdlqvMCb+zuq0VrrQlRRM8hxeaJ?=
 =?us-ascii?Q?T1MYMZ6mk85A1+B6FI9ZBYtUXNPl56UejJIJyZU1tTwT/3pSFOmSihC1tU2A?=
 =?us-ascii?Q?EyAQzdccxdmq3FPJbRd/QjnELVFyaBckgoghNPN2Y0n8z9fJD5q6NXgXw0BL?=
 =?us-ascii?Q?wDx471YHC426lLZdzmauStlmWb72qNPTjWbXDiL8aSi2+tJ1SeiMeiRWAHaR?=
 =?us-ascii?Q?QUmJUENufdA83/J0+y4vd44noRVDisG+swY2L3ppzFWXZJzE/eLSHeCCEdcw?=
 =?us-ascii?Q?mIrZ/4LH5BiI3M8UbFuunX1g95cfDIccwBfg9VN97bebI6Is9m9vO0nGJlcc?=
 =?us-ascii?Q?hAsNkLaQbWLXGdKyMobAZ6uG4zvKtrgsf4ZtNHWthLE1OPfnCR951zszBZBz?=
 =?us-ascii?Q?to+xeDd+nrF6Fat8Cx2ixFxO2ohqkSNdFkNRkd5qUjsgMeyniNgV0+f8L76p?=
 =?us-ascii?Q?OvRS/dROkYAJHvFC/1clFwefzVY8Mbmh0a5cWTgDGpJD1PYDw5WDV3qpPGfG?=
 =?us-ascii?Q?m93LckqsUSZ2ZGjWovF4/yPZZcN8LcgCTXy/mi13WRwYdY2+HRGaLSCag09b?=
 =?us-ascii?Q?emV6zs8BIsHVY3C1xvXA9WVM+Z19zI76HBGgOIpUfcEA/FMSlgHdrq+k02fW?=
 =?us-ascii?Q?YJJ4X8DRIe1mjSmVGd3kIOAuuwoONFemSdmO9UlVxf3oObXqchH/aUWJfwqw?=
 =?us-ascii?Q?MPSxJZVvw0vLpozU7VTh1dREX2SdtEctwXGZgyPzdg+MD0kiXRaHtl9ibzes?=
 =?us-ascii?Q?3wrLBqhEEy279VgLBvWjSoLHf0qFxJK6NeoirbIQev7wd0bYqX1Ewq3WSWF/?=
 =?us-ascii?Q?K6O1CJyqeVYded+Ek4S+qGGPE8Ty7xduRdCHfWQk5+wwXYPKC6rlc+c/eEam?=
 =?us-ascii?Q?1dbFHqh2qdX331L9cij3Zcw3eZwTFiFqRu7HXi2gbewIjmNq0QRYds9Em9+a?=
 =?us-ascii?Q?kkd6doxIZLgraWT/4FlWVznKai6jEy8SAVHPbHfXEg7/9czzN7yX9NgHZB6K?=
 =?us-ascii?Q?bHKs3mV+ctEkfKq/fbqG+rf63TaAU46lXRYzx5f6xGheu36MKgyJBP5JZgsG?=
 =?us-ascii?Q?BivS02wn7WaAcoWXTADc41Uee8OPZHEiAPe2cD0lc67oFZ7VUWLU3hb0BjEj?=
 =?us-ascii?Q?pKzFOh0VQ/5NYUbNw77kwRDlqV0dxv+YM49CXWSJ9AZDr894DYOEkTYu16rD?=
 =?us-ascii?Q?IjV+3mNron2wxh6TR5atJS+03Km6rgQseyQYj+Cy/bOqrxe/xYJuXgEGUAaX?=
 =?us-ascii?Q?gDYXtKBhHJ2aTXV+cIlGWuvgtf1pKmDJQddJfnVb22NyiRz8Op7Rn43ryfqG?=
 =?us-ascii?Q?c9M+NKxX0MN6wLA2qvncEHOIwIdPbZOTm89lUHHy86EF4KWRxo2k5ZgjAqmF?=
 =?us-ascii?Q?6qUrVEUxJt0x0wImGrK9SC5pqLDHSpXKWqForqc1RvHwuYZTHqPiet+lnb4w?=
 =?us-ascii?Q?f5wHXSJLO3Ls8SdSdX0Es78X7YQH8I2uCRyswuP0sSYnAIkJXqnsKbO78tDy?=
 =?us-ascii?Q?7loKxqo+CfxGqhRPJark1KNnPyNCoMi3VcWR6tdimzk/984uPbe4jkyHd7j2?=
 =?us-ascii?Q?dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR21MB3078
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

From: Saurabh Sengar <ssengar@linux.microsoft.com> Sent: Friday, September =
9, 2022 8:10 AM
>=20
> Due to a full ring buffer, the driver may be unable to send updates to
> the Hyper-V host.  But outputing the error message can make the problem
> worse because console output is also typically written to the frame
> buffer.
> Rate limiting the error message, also output the error code for additiona=
l
> diagnosability.
>=20
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> index 76a182a..013a782 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> @@ -208,7 +208,7 @@ static inline int hyperv_sendpacket(struct hv_device =
*hdev,
> struct synthvid_msg
>  			       VM_PKT_DATA_INBAND, 0);
>=20
>  	if (ret)
> -		drm_err(&hv->dev, "Unable to send packet via vmbus\n");
> +		drm_err_ratelimited(&hv->dev, "Unable to send packet via vmbus; error =
%d\n", ret);
>=20
>  	return ret;
>  }
> --
> 1.8.3.1

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

