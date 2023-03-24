Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0BB6C87F5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 23:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D1610E1A7;
	Fri, 24 Mar 2023 22:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2095.outbound.protection.outlook.com [40.92.22.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827D410E1A7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 22:03:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7zms+6IEa33SKIm7rWzrAAM6XdhmsJ1FOxbG4FItRw939nQZg/BGYZZWzUrMZy5xP86EUQLPmNk0byo6tLB8j/JQZn8uuzflOr7si7IUbsyEpqNgtz2imE+KwouNQ0XevgbsOKZTQ60YsnyPVRyqWJ/7tJGvbYcQd5e8IPchutOQHIjiNxXsJmB0a/vg2LwJr6lJO+rfXDUwHO2MdQRVuuyZDRnrm91ku84KUnnU39H0iOOuxMYP5nAFxP8usIAagkGOmqoSdPEj0UzwEzI1Cl10eO1n8fp7x8mW2pqKqWPGtlD3/lD3ch0AeVB71EWqUv/EMtgSMsLHM5VykiLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+xMbvBcULKfnybauQHZeE37eRsLPURiFjmj+sbhvz8=;
 b=ac7bIuBZin+A0kUlpxz/3He27HUAZhBrUFoz7sstm9Y1tf8IciOSOdGNsq43V1wZg2FQiREtxE4WRBpocGxHpfZdemKw3yVJ20kEkQf07B8FvlQtMTDcFhNCGimgZ4NPYnBB3fw6aU01DdcEdSo3nhed/m+/azswY2f+zj+/SGX4i5njh8IpBzLjZqWoaTYB/qnEc/LEGr0DfBG5MvPYRHbvnnLFOP4B03i0IgnxVyTjrXvUZ6rP2Q1YxQuUx+1Z6gFHZC0CmOc57RtLzWwV4afVqQyxFgDfWG3ekj6xSv6Ad6l+Uh54FmIPNWlccf6gfCxkavkZjEm9Ln3Dc5GTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+xMbvBcULKfnybauQHZeE37eRsLPURiFjmj+sbhvz8=;
 b=JTOhYJ5lSPPaF8+PEX/KuILM1RjfCiTZPssYXApiyzhordsiVi41g9FJ6ybOiF06mb+Qp2Wgn6+gdoypVGzXac6R/6pd5y6Imo/sMT7tI+03rnbWJlHWuGmbVzIwHhY4GM3O0bRQyVkPmZu1ge2jEe8DoB+DBldEHMNXOb8GN1bQ1K5Si4mI0WP2hmK0YHXdDsHWbGRb6YcdtWUrpyBGbLn1emKUtVyDY95gIPpy/DEEhRKI5WQIosI/V2oNUopwWGu6rmtgLBqDKyKLGOQ/La6qdvLEkQNfMPWqFhE4H8CoxZkISAxhqzWLxRq1mtKi0PlsCEmYdP1CV61UfhNv1Q==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM6PR06MB4410.namprd06.prod.outlook.com (2603:10b6:5:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 22:03:43 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::1ba2:9d51:aaa6:2f4a]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::1ba2:9d51:aaa6:2f4a%6]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 22:03:43 +0000
Date: Fri, 24 Mar 2023 17:03:38 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/panel: magnachip: Prevent error pointer dereference
 in probe
Message-ID: <SN6PR06MB53425022898EC5606281166BA5849@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <de0273a8-8910-4ac4-b4ed-f7691c4d2ca6@kili.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de0273a8-8910-4ac4-b4ed-f7691c4d2ca6@kili.mountain>
X-TMN: [J9rTSjtbBA/kkDMAQnGmf0ZcVWh7i47g]
X-ClientProxiedBy: DM6PR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::18) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZB4eOr5tWm1dxqut@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|DM6PR06MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: ced5548f-4044-4af5-04a5-08db2cb3a1a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTV7Tkwqi1g90O5BHRGh+4npfxdY3fa3DhcVsh4rvdLDwhWS9v+Cm/FEyJQG4pkRXQqKYafvxipph67kZA/sQdWlxQfXF+Iwnsx/TfhPrvgat03Mi4BORi1EKJY4u5eVmxHMeGeHnsdJjevzxxqg8MoJug811p2HeA7Go8GdTxEAiiDRYu7PwF5q5imb01adFWJfyRK8zk3ZE/ZqGYFRlLCFUUap+YA2aK+PvAwlIu/R8teB8aV884vDemH9czYkMfvrti3dXhyJu22hTbmu3gQvOD0et+kf9a7xMrJsk+rRnXek7LvLcm+yciDrIxNy66qGNxgpu1w/3/+GA+1mloO9qvNRzaiKfPkRXRt5imn7/q4ZMW8tHNXVqcLW/j45bBVsQN8JYS8Dv5H99rwlQcDgA5NBmMgXMMgrnDIQQE0OI4nV5LfS0qt6fYrYT4X0flGXJVUHMrgsNya/vgZUMMT+bgOVTezPJCbq33Ms/rIn49/G/LCuFOckrd/cQH1wtRC/khN/9RFzR8OZ7Ry+N4HsH1FOR2ksdW83nzphQQzc+z/nE0K9Duf6QPf24L5dL4rIRsI2ST6mbxE6IA9Otn1Puf7GqOmcLfB/b5OBwe9dQKFOHD3P08izaZ38U+TtAGJ5ZT8Hgy16PoKwexgh6A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v62Y0TzCeu1+C6FMqPxr4COhaA+0QFYi9CSV8V5VK/FDiS+msVu38FwgAGxD?=
 =?us-ascii?Q?4dM/hPlRJzAS2aUp2gCgj/Cw53sQOf46Jr7vNOq5v9ASeGhuqn7GB9Fv30wG?=
 =?us-ascii?Q?N5Ajel5AL27toAHpYxMgY3/hBDFU0+/A7G4q5ehGMmzYTlhtYxgLOWPlMihq?=
 =?us-ascii?Q?5MB2S9QyxXuWP0ZG9QwQkHYGfv4MBueQNbCJPvkhmXxvxW3PEoBL+g4nujGJ?=
 =?us-ascii?Q?zqb+DawuhZDWJquc4Vih0LWJKr9BFI00mSant5vyKeqF9qTCAQLSXP92nPz5?=
 =?us-ascii?Q?j75Ua4+DcCee5+1ijOGyQ/truRcksm+gN9CAmtmB2XalXoCFnNiDDspwYi/v?=
 =?us-ascii?Q?eU05LklVXDeJOFPBGuImgtDMv8pbHii1FQDK0Xg0Y7JqH9Eq9CbecHnX6UYh?=
 =?us-ascii?Q?rWm1eySomS+mVNLNJMquBpcWGLHYnxxK5ijb7CPI+KdrtGNCpUqJsWF11iRy?=
 =?us-ascii?Q?aOKkNQSm2M/YmMb2r2HGcUAz3tLOMw6fusrwUdcqoI3HSmxWIuxrwidb306i?=
 =?us-ascii?Q?CNW92WU9nJw+1OeTMbsa1nKaJaG3+OdCAViLcrMiGTErJlT7j/+TEAXjXbDM?=
 =?us-ascii?Q?1N/2dHZAzwwNrM42sHwljPPamps8hz211MKSI4TJ/m3BOnkPokXNYFx2NNsA?=
 =?us-ascii?Q?4xA3bVmJUWJOmtHeQ2etqveBaNhxIBFCfR7HJlBxMkWegcd0Die8W6CoEPs2?=
 =?us-ascii?Q?eRpiEyN2+ryKv/pdHXSAFarLvvbzoSJQjKWZrY3Ytbi6BDqxREWcWjTVSuTn?=
 =?us-ascii?Q?yCc76Z9V2WwoNaBmNCbqYfuhNbhfeQalc9p1sbO1Z3wj1N4d/mPP+JsIEEA9?=
 =?us-ascii?Q?qie09/2++dsSQ6flMpsyMHrQRWszeYydU/Gs0yk5Q9XdaPycJbAjNGTSd2vG?=
 =?us-ascii?Q?/5ipWDO0/RN2KFujXeyLHA7pMNkwm5FDGYTawQtUtgblmvTW3TushdOiBDta?=
 =?us-ascii?Q?8YwRIDt60wjPQwuZrWYfP6DvvW3eRr0DZ2skQVqaVHS70ZEAdNx89SB+bfk5?=
 =?us-ascii?Q?oiUnzXpI4Gl5yE8RwxiaAarsULS8uXLwzmQfdgEHEDUmKgLx6EQaNv6co8yX?=
 =?us-ascii?Q?AkKKz+vT4P3STM+714bQtxIUcq9v8cOKCesFboQPDwrwcUVxSl1lW9yMa7l7?=
 =?us-ascii?Q?bw3o2puvg+HudK0WfJzuc7Bi4qZqLJUAx6nPKEHZZMX8v5WtA9OJC2+7K7zX?=
 =?us-ascii?Q?8I0MK0fHKFw7ctm2VAH+ERzndnVenXvMvH32kaBxC1K/krwKXBtNuU4GuBkI?=
 =?us-ascii?Q?NRKPWozRIspZZoiQJ6uxLAIujbvXCECnpSHnB6mZcA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ced5548f-4044-4af5-04a5-08db2cb3a1a8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 22:03:43.1436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR06MB4410
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
Cc: Sam Ravnborg <sam@ravnborg.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 12:07:10PM +0300, Dan Carpenter wrote:
> Don't dereference "db->dsi_dev" when it is an error pointer.
> 
> Fixes: 249a4f5e663c ("drm/panel: Add Magnachip D53E6EA8966 Panel Driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> index 8c362c40227f..26d358b9b85a 100644
> --- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> +++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> @@ -418,7 +418,7 @@ static int d53e6ea8966_probe(struct spi_device *spi)
>  	if (IS_ERR(db->dsi_dev)) {
>  		dev_err(dev, "failed to register dsi device: %ld\n",
>  			PTR_ERR(db->dsi_dev));
> -		ret = PTR_ERR(db->dsi_dev);
> +		return PTR_ERR(db->dsi_dev);
>  	}
>  
>  	db->dsi_dev->lanes = 2;
> -- 
> 2.39.1
> 

Thank you for the patch, this looks good to me. Not sure how I
missed that.

Chris Morgan
