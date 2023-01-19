Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B39673D1C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 16:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3220F10E97F;
	Thu, 19 Jan 2023 15:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2029.outbound.protection.outlook.com [40.92.22.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBAA10E975
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 15:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4C+atf6qm52WiLXRJPwPrIrfjmsVt+hTyOIHK/dZ5t7v3Za0NsVJfalXooolzy6kM42jRlkvux0Un3GP/TCfnIEO7fLGBTVg6AGsyMlZqUwnG7prFun/lA2sNR6Ky6hAKVta1nctXvbkB4eUKEXSZ8RvRY2pb8mhOtYPrvRHbBdVEIU22w6StWW539/SECbpKb98YQEtpvOer00lXWOVY/2v7eFjxL9kIxPUuFKhgBS5ghOQ7Vn/A/MgWn8I5HJV1KnWwCnzpEiGHr8zxbeyeayvuWS6Jn58buw9AmFgHOfAq2xxbfWWkVCAuYKwR7KrguuJ83yyFH3rGoFIjll+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5zU96Nfw/1LfWDeN6rJMurXno7exiwm3mBlMPvRfec=;
 b=XFxV3x95m0TiIymi8tI41aUbqjffckCKJnoVuAducAs5d+yiH3GrhP+YQwyz26bu15GBZEGyE3SaHOnrNBY9h7SQou3Pv7KLWrVDZW6z22A2n7t4L6slEVX7JWngpPBO0T1AryTXUK07347oyVYiFmDmJ6VHV16iZsnTDnPgHT7mOfvGXcvbQ5tO8FOPNQxzIRdST1cY4Q04IUE18CRcHw5jQyAmJdrlDV5Ea5T9XN/GZ+vUi/zsLVViwlaQcbZSzOzIU8Una/gQSMWIge2jhZR/l4S5QkTmGmSBRTtdebIhSuLkGcqnxDD1mq8nZL2VctFT97wBO9ezXIQGn+FpVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5zU96Nfw/1LfWDeN6rJMurXno7exiwm3mBlMPvRfec=;
 b=jbvAN4vY05MzWU9bAzOJ57Fi0J0tXlCDNX/yMmiMC3WO9GCTaz2ixqf6yMZSgkQL2fFCAy2+6d3XqBn1OHZsC+PZlH4LpAbIJkuHMKA2yWnG30aT8uhSgJqC2dc5KUY+DXG5f7n9Eg9gfiQ6na6PLsp8uN6FZ+xXGa4uboIhaH/4nJHzyA053/lUv/LTgNXqoiA9waDmvcBtTifgOH6P3jtbjpzDIvRJJsnUoZyxILysDilK9muNVvsVhPPc3eQxsFKs3abqY4/1GMe/KzrG6+I6V9GbcOoRbzpt/0RvhmwsrJ9WlvhYlp96RxNYXqQHzOG/NGyxcWdQ4rtNB2jJmg==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SJ0PR06MB7083.namprd06.prod.outlook.com (2603:10b6:a03:2e0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 15:09:08 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ff4f:2e64:cf70:cc68]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ff4f:2e64:cf70:cc68%5]) with mapi id 15.20.5986.018; Thu, 19 Jan 2023
 15:09:08 +0000
Date: Thu, 19 Jan 2023 09:09:03 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH V11 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Message-ID: <SN6PR06MB5342B2ABF5C08A2A62CF8715A5C49@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230118233135.1174859-1-macroalpha82@gmail.com>
 <20230118233135.1174859-2-macroalpha82@gmail.com>
 <20230119081542.lfgvaj6lwwdb2eaa@houat>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119081542.lfgvaj6lwwdb2eaa@houat>
X-TMN: [lcnx6urk4fvGOQ1Lc0ulVO7l3+aFfhFs]
X-ClientProxiedBy: DM6PR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:5:74::35) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <Y8ldDwb13TG98X7o@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SJ0PR06MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 7461db61-9c75-4c32-fe3f-08dafa2f1c79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1jMsbDLiHxoZBZkzDdG+4Ixi8aSG//4F4y+F8KDKO5aaHcQOMRs83LqAzrUqtuO8GZe5f8wM3PiSUTcO7cXIdsHqxRrBODGYdcJjrBwUNWY6KV4aYsScbtlgoUkEPandjeVO00OOk8EmX3FempD8w6zDyHP7Awj2jgFaQDddNz5mnX1Y6kq0SVbyE5OGKoUX50EgHaGbeutJzWvNIBX7DoXsyIFXC9IKA2CB4gn2COlQ2R5kf+SVogfZ+n1Va2On+FfZ4fdQ2BsK+RJkftJ0eqF/QieKZt42qbTK6Jrlm8LNnFy33o7NLlHpzI2sACC8LoFsgcup1jps9gy4dJd/dnERpHpX2iHsD21P5So1GrB4YGkNRX871etzkR8Bu5RR9XCbKdx4KZZHIAJGV0fk0wCYApLou7gxJ3HJlQGi+D/MXceCHTHzep2t56/IhDd2/ZCjdSVh2Ll+2nDZo03rMJ1NyOkbJ4d4tDJw9hq+Y7Snf1MgvV8VYI6dP/6Vqoi9U8LrxWovNVqvvdrFLSbezUVpCl8loVij20cFQ4af4jBW15odQNmC44SQBPECHM/IEjn0iJqpWKDzuhDP53SkowCVYRI5Ai7Wjo+EiABAj4b4E0GT9FI7gWeVflNtWRFVGRCw8d/L+bmhqwLdjoooA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+4oWPLIeOhAscu1k3fMExSmB1m2fe+3dSo4aqYwSgX4s/iVKKAa5a2AEDF45?=
 =?us-ascii?Q?JObpPk0yhd6CNdscqx2w9kosNqi38RfVEIlTO+E5S7ORxrJeqaZbI1DMOS48?=
 =?us-ascii?Q?O/pilwirZAZ1IUXCcttBvf0PlPLxVfKaK8IBG8BZYFtUYwLV3ebehPsjwaVS?=
 =?us-ascii?Q?AQa0Xii3TDA6/9xDUMWp99ALe9CcvIWYEmtJ16UKyQQ2U4H3ubFf1bHN1Kvl?=
 =?us-ascii?Q?8gRCVKUyFXL+JeQyt+7KM1ucVZheWSMW1eY7GMz4cDbMvW1DgEjy8mhSmbl0?=
 =?us-ascii?Q?5dLgSHWKGBtnABAygjiPscBwlDWlUxJasO0NTbo+9Sg//rdNIPzkEgDBJJT3?=
 =?us-ascii?Q?usQ7q/TBWoVp7ZtZcBAye1O74vYIIv5J8AHzfn7a5D63AyO+knjM5yylTs7p?=
 =?us-ascii?Q?Wg+TtX+PIekcuLHQbI7bFJx97sxqbtW66KbH27Epg1oq4h8xeiyvIztsnGAy?=
 =?us-ascii?Q?sRmbg2HM+6FDjL9yAf0/01jn0MWNcPPOhSu+b/OPVgHQMI3P580mnl3khd43?=
 =?us-ascii?Q?DEOs2sBLwMjzGb4+KBC8lIwQ4mqChbrKP42JxPKQyxmgcvgPCDQN7RR+N+Ns?=
 =?us-ascii?Q?kgZKXt1CD+0F0vEFyidyDUgYH0oKV8HyaBfaJV4SRDqBe9NmSChghRa99nnL?=
 =?us-ascii?Q?lmdt0hRFZ86uvEf5oI8yoN8l23LqOEvUFfDe1MOQAsC+Q+HwwmocVSUOV8h9?=
 =?us-ascii?Q?IEv/3/wBGvndQ5wc+D5MCOXyR/TX83Y8QnExYTQHxCShHHZaLHMEWDyzlHtR?=
 =?us-ascii?Q?EgqF8kIZDQA3CEVVb+D5jrcJT+hdmeMlJlWyRNeR4h23eoGcHMuxHF3rYGb5?=
 =?us-ascii?Q?JknrKO7vHbMB4xIif4pEgHcf12i8VS8bdJqQ2tCi78Y1xFWbEb2RQE7WTzO7?=
 =?us-ascii?Q?Bm8axZIcnKq+SJ7YTZS0USRv2h1hEa66ICCWaA5cER1jBZhTaMaNJ+qqcYCX?=
 =?us-ascii?Q?qdYc7F59hIyRo1KriyDW0eL+M2QbmZ94YLGQWyMvTEVwIa0CUIOalCTO1rVK?=
 =?us-ascii?Q?G+eUqsk45H1Dh2KaKT7y26K0o1w8UfOrPhM510uQPTC7Xl/YfxxTcVrAJR35?=
 =?us-ascii?Q?vU0gUa+qUZ8M7nyHPPYatlytLc76xUkvVc9M/lEnGoNg1ZNdJQA0eT672xzd?=
 =?us-ascii?Q?4geKZ+fXYH+MKGmgzbFKwVjwgtnp9MwHYDgPf8e7VM6fWnjYa/WMV5i6jz4R?=
 =?us-ascii?Q?rHDRGKmqf72PSQeVmEQUE4pH8qrBvTD/UH1O5DwupuFwOWglmiAFnt3tq8WQ?=
 =?us-ascii?Q?Kquxw5qDA4Y55mCZ9YfdxD9NrqLLhCNV2IvNNwJXSw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7461db61-9c75-4c32-fe3f-08dafa2f1c79
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 15:09:08.8103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB7083
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 09:15:42AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Jan 18, 2023 at 05:31:32PM -0600, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add helper function to find DSI host for devices where DSI panel is not
> > a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> > official Raspberry Pi touchscreen display).
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> Sorry for not noticing this earlier, but this is a bit confusing.
> Signed-off-by is there usually to follow either the authors or the
> maintainers (or people that passed the patch along).
> 
> Given the order, the SoB here indicates that it's Maya Matuszczyk that
> committed/submitted that patch, while you are the author. Obviously,
> that isn't the case since you are both the author and submitter.

I borrowed a few lines of code from her, which is why she is listed
here. If this is not correct let me know.

Thank you.

> 
> So what's going on?
> 
> Maxime


