Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF3343C09
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 09:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507BD89B06;
	Mon, 22 Mar 2021 08:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E21789A61
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 08:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXQazZiTENmguN4aXEyvREcQVmZf2JvnQLBB7MP/RrXom9CiyO25mfSwgv/fywxrI+rM/Is15zbxMBxSzu2AoLslcKEavUjKz4UKQYj+MVkiubZ4bgFUI+y25ej846QhJVzG47O/2Zod3qPV0PUZeay3KKbTAPbLfznL/cguruGBEtZomSDJZKRUpstGQc/fUIsGIbD5OKMFi7d3buppniNVEPcAmWI8QJk+KWaxsHjqPWb42x1XYP6H8zCybY4J9z8sfG8wnuRCoJh8VnE0WWHvFxEgEJxtxzTsAwxrsYO70BoHWzdw0aqojc7Y9tx451HGJowRVsq66nJt6D0GLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jo/Nab0/tuUeDk7/eEJBPjPnRZ4eV0SV9LxUNORdHdE=;
 b=SHWk/HrcmQaA4bybMr/8JPbox2lwMpvCbkjjedFrqNDUF7kgu7dW1fdQFjDxt5BzsW2DT5bfX6xu6H1+Pn54TtX81SJlHNYjkTnT1Ivj7QubJxR0XziFTev3uQ1iIhGOy1qzJVY5Dgywaqsjbht1/JbZD1K7JZMwwJ9f0eocKhzg+4DpO/uNuSjPasoMP/QBcaCuZmB/YSW+iQJPT/t9n8RNh4s4BMtzfyllNmt//HTnEWBWMuB1tsCx4YuTxZwcQvogplcg3mKd4JCKLEsu4oj2DjodJItUJkzQvI3ksqQoW/6WsUzG0nqUL/SLOoI/LjajhR3AoN4zGSlXOPld3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jo/Nab0/tuUeDk7/eEJBPjPnRZ4eV0SV9LxUNORdHdE=;
 b=D22TDxrsvchXnt2pZTX0MtOM8aJHgxzpjX1wuKnQGtoaXuaUAsSQaJ/iKbphkaDvZQKmE2Tn3+8IAlBfBjusYZfXZ8DCuKYRKSlqjrRvvqIlHgwic4VeNYy81hsIcuWaUYnrm5QzDU7SFjEt+VamRlp5kLDYJJRIY0Ec+mJf274=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB3181.eurprd04.prod.outlook.com
 (2603:10a6:802:a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:48:06 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad83:b72d:23db:7034]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad83:b72d:23db:7034%6]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:48:06 +0000
Date: Mon, 22 Mar 2021 10:48:03 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/imx/dcss: Use device_get_match_data()
Message-ID: <20210322084803.xc4mhpa5mbduoo52@fsr-ub1864-141>
References: <20210315123811.159205-1-festevam@gmail.com>
Content-Disposition: inline
In-Reply-To: <20210315123811.159205-1-festevam@gmail.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:208:136::26) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:208:136::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 08:48:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04bddfcd-5f20-4890-bbb2-08d8ed0f3621
X-MS-TrafficTypeDiagnostic: VI1PR04MB3181:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3181D621516AB2469030CD18BE659@VI1PR04MB3181.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpDiNYT2PIKcETvYaxpYqHYbYLdaUEbFKmQhazpiq3WnPolq/028ZGIUj10nfawT6cyjnIa/QExe/YRaHhKHv4YO1/uNXB5KgWUOtZabbJbTpzrC8erfEpBgXKjNAa/mPMD0UOeRxutT8D9J1xXWvr7GA62ykNaW6RjD2CgPYeyRLeSkI52E6zXtkqahRDJIllr/gYKRU4Xx6tN730z3XfI32P0nyKjpjcHsFg1viApiOifwimux3faBVR3WlllLjKy3uwEbLtTLkZSX3ZCnYu23IvdC9wzZ31VO64zreSfMVUh/nWdoJPIiLFF4QJbYbCBb/IuvNYoWrPilOhvF5f+BuQG9Iq0TVeQ3T8nQqDcbel7C+fngjxrJvHzhq0vNyyx5Lmt9vSzrPAVh5aOUB29r2KfIa81qmDXrCesvwJekK8yo6SdnPH8UpEFjXy+tVB3J+W8FUUN3EM4Vqsmm2jsrK6G8isJFVb4FfCxwS3eZ3gaJRxPQ0bGXjB2T5svlquStdE6AmiBMbdn9a5qQZUinAD+uxSskx7hp3cBN1H6Y3IEkNxDraatoDm0EHJdTt3YUhiWqXW+ZgufwC55Cu3SkIRjHkYsatXqKf1+J4CibpuWGYPGcKGs23cPQqjPwq0P4oVwtyYHPsDByQMPrZdhRK5WQWIBjeef6vUo7GIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(2906002)(55016002)(33716001)(6916009)(1076003)(316002)(5660300002)(86362001)(26005)(8676002)(186003)(9686003)(44832011)(8936002)(956004)(16526019)(38100700001)(83380400001)(6496006)(4326008)(52116002)(66476007)(66556008)(66946007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?khR4rO6k4vnkXjO2J3MGL5obBLw3HnvLGf1dx/jh5AwCkeXOJerSBpvDKcRB?=
 =?us-ascii?Q?Ei0FKhlgIK6xbXZfct26FbAnMT7/sLQ08Re1T5fJU79DS1baJ60tho6TYPzD?=
 =?us-ascii?Q?U1IRc3slUn9RogSzzDNNLvdIg4hLGP1ZAFHTLUUj+xRfX9ngA4zgmyiXprGB?=
 =?us-ascii?Q?/9CamOrx7iPNZLt8kZqSC0NUIXs4BQqyCO2/+MTl+JYe4rjxWCBHBRWgYpDk?=
 =?us-ascii?Q?enVgkuZy686E1lchYQf5AQX7S0IN/ddSjx9FAvanTAfiKOIyoLLhQNK89t3L?=
 =?us-ascii?Q?epL7xPcofZFAkOGyePY+t3+BHToEbEAP6TkzSowDSIxPFrCjD16paU37y7ZW?=
 =?us-ascii?Q?C1MPTaX9fRhbHJ1lI6MokVgazy0BuZPLbExZhoLFWzDhGV2a9QtKZIJQhjwE?=
 =?us-ascii?Q?bGop+SLl7EHQHr/1oyEdIZrVjVN6wlJpVnyh0VfjbrTFl0WN5752BFgFUXxY?=
 =?us-ascii?Q?IDB8yA05z+qn13hQ9vd9aTM+DBxHTt3wPqE/UqcZOam/Ot3lXBs8XtGbuk2q?=
 =?us-ascii?Q?U/v1shnB7rDyuO+neTfqPGVFF7FGtk2OhwNfhVJSpdq7KFYEnfROYyRktAnt?=
 =?us-ascii?Q?ZWBJeGDvUdGRwy2i/972pPWyZ7uwa5wERBH/evR0FvfAGPbaVjHwHk6U4BtS?=
 =?us-ascii?Q?wxh9t/aIb1wadJp5e1RU/jkYxdSvLp1gNJ78n9oyUvPvqG8zqZwpRj83PUCI?=
 =?us-ascii?Q?xyLmICBBNsoxt4Jp2OSaBN2ZSvZTfh5Euw2uOcqvydZZr/o26slBHVnKBzRk?=
 =?us-ascii?Q?woXGAmYsnDLTsqjbtvSSi31a1lVI71SXZ+SZI1+Dk/vJDZW7umtTjsEVDRpn?=
 =?us-ascii?Q?kZYyqGJF8UCITnSjEa1jfz/GmecN6zND1GdMiCCRgFJDMCq1W2SROXmruyXV?=
 =?us-ascii?Q?PYrmh5q9RNBOPA/XASUV1yGLtywz6XUtOYxEnlqlKSh8iXt+qHLa/QcjXkiy?=
 =?us-ascii?Q?LKVeGTEUxwmL51x09AOB0uzdAqUUR8Os//9ODtrVNJzAejo00GVUDPqayc4S?=
 =?us-ascii?Q?C5opB8ChAASkB+NFN3wErPdnw59p3cB5OH4QXK27S0c0CE7OqEW1QDAulb6G?=
 =?us-ascii?Q?cGUS6lYlHPqV/k3uMkunCqLyxoRwnqRTuMihNsmlimyG+2qfCIzsCkYANwWd?=
 =?us-ascii?Q?1Rb+A7S+lasoVCPhbTZuFTKYKYeNOs6NQ7Ii07+TkYfyNlcHG1JvTKlxONv8?=
 =?us-ascii?Q?8Sd81WC5ZdWTr1l91OjuudE+JDR7vUOEEmTIS9x5JfDE31i6KapGShffesja?=
 =?us-ascii?Q?TVv5W9oSrrQJ5Y/PuHOJC7ICVg4ecPdr/ih7cqYXpo6fgOv6sUmyyajXZDFn?=
 =?us-ascii?Q?astX2bTjo3g/XXkwTbqjpHtv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bddfcd-5f20-4890-bbb2-08d8ed0f3621
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:48:06.4965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOOlv+gGR8A3QaK5tzxaCBZi9JY3xxn95WObZX91J/aCjx4o3BiPmlo7PRH03Ew6MF6crsiHcrpCSO64usHdxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3181
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

On Mon, Mar 15, 2021 at 09:38:11AM -0300, Fabio Estevam wrote:
> The retrieval of driver data can be a bit simplified by using
> device_get_match_data(), so switch to it.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

> ---
>  drivers/gpu/drm/imx/dcss/dcss-dev.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index c849533ca83e..de0f02de94c4 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -168,13 +168,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  	int ret;
>  	struct resource *res;
>  	struct dcss_dev *dcss;
> -	const struct dcss_type_data *devtype;
> -
> -	devtype = of_device_get_match_data(dev);
> -	if (!devtype) {
> -		dev_err(dev, "no device match found\n");
> -		return ERR_PTR(-ENODEV);
> -	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
> @@ -187,7 +180,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  		return ERR_PTR(-ENOMEM);
>  
>  	dcss->dev = dev;
> -	dcss->devtype = devtype;
> +	dcss->devtype = device_get_match_data(dev);
>  	dcss->hdmi_output = hdmi_output;
>  
>  	ret = dcss_clks_init(dcss);
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
