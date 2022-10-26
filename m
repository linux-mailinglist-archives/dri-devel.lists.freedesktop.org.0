Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4BE60DB92
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 08:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48BA10E452;
	Wed, 26 Oct 2022 06:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110F310E452
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:48:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPsXuvat5FJTa00wK9wCAR5dxTSJmcrCz4zKXoGJ04wkPCbDwqw36pai2Ck/SGFrDcli4zJqwPljIkJE4iBxCbaDiqd8W6bGdvRG8g+RQtBPD7mt7tkcl5s8CdFTsA52mIZ4HVXQfHMOP/D7DPw264MxGe2kNEA8Q+6HSlJOsgcqibDi3Ta2rTlwC7eAQnYE0T3MH7hvFaT9+DcgD5a1rWBt8BQ483PywtOMXEDqe7MIkqeDQ1mGMzVxEqmxOc0KJ8V9lj+axLnwcjnptV5CEpeXX1tjJWW72y3SiQkT4crjGDP/Y+inB/xRxPn5ekwC5uAMcWygzXGetk8lOf8SOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5dzZN/bRWj6d1nMzh1I45jpzIItFnKy47d2Ne59uY4=;
 b=OWk1xgrda+RpoaPFG3/nMIVrbWfnAqSQEsCYew41v2crai92l6Wvq5TCxz/YauugWLsqgd8yYN5xFmYxFH9aXZ0m2pI0GTuioqYhOGQX3gPMKG0tQn7oNkgHFHxQxvOnY9nEnBenZ+eqBNin4C6WXlpPeFii8lz1i7QEu+juWP8ce3JEwymHzgUt1qY+gYg9QVr61IUz1KSxLZeEjG9GmRcilcXxrRY99jRIlSm1XCEkkwYKQ5+MijhBwMSqnwSyJNQap/O3ddGbCbRw/BCSl9KhdCGd0XSuiyPh44CbvwYnNgR2ejEdA8dGA42wa7MElPqX6PbtEpa0il/RKvkEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5dzZN/bRWj6d1nMzh1I45jpzIItFnKy47d2Ne59uY4=;
 b=jYp4J/Z+Las4JE+PD5gjQIt0cgDsu0k1QyVsbSzxD883wqpnYtD5HAsxkSMZBpg457GYiWn+mssNpeseY0q26KNKsPJBYMT2FMfVB/OB3b0iYMJ4Pc4yO+OiY7YZknBitv5Gc03HSChw0QElpeqC4qd1Bxu23bI4JNdkj+G0Nq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8434.eurprd04.prod.outlook.com (2603:10a6:20b:406::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 06:48:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8%3]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 06:48:41 +0000
Message-ID: <ccc935bedb154883911750e511be85f4cfe70999.camel@nxp.com>
Subject: Re: [PATCH] drm/imx: Kconfig: Remove duplicated 'select
 DRM_KMS_HELPER' line
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 26 Oct 2022 14:48:00 +0800
In-Reply-To: <20221009023527.3669647-1-victor.liu@nxp.com>
References: <20221009023527.3669647-1-victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: 126e7433-21f1-43e3-703f-08dab71e1e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9D132OXWY+KWgWwigEMaUGvQuH20JGWR8sL87fwVZZ7Tc1Mwg69rFqo87FcaBnCGELWgGjo3ZvJkK3iMJ0ZOOYk6HbArzYjkFO6K/JbNNj1qTB+tVc5ZVeUeoaBK2OPEuUjGfregwMULMWR5/o7LMBlqK7cR6/vYpSMxJY9RJYaL1LgGHjSvGqS6aPjh8Jhe+tgl8IEUmAQaItc66732xa9rzBNSCYX7YEXe15+op0HlZS4xh7M0F7zRPTKq0IM3ev0/w3bjoT1uY8TVn3vDj/+IcJSNSuYddSv3XX4ibn2CeOCF4hgrfu8On1RwcrmZCFz9Ft1ZTnKtNMZrHdkX5GrQauVIEfmIt+nkELxFb7X/MuECR6WWAYz8c4gb927ISRQqkCt/PRYqqRQAA6rljNm/5lZ2cofH01imlfLp29FxPSOSaceOFWupZufUeCBh6us7Qin6AMH8dKRu+85WIfnlMfaR1U1WbT69ZamoRGJWXgoc6Ba9xxONScv2o5kPE1r7Gx/LAYxee5fTKCS/aCktjW6e6RdyWeiLfhcMBKnRqTUOIkFAhKM4JOw7i8bfjP7zhpBVMkZx5MC60zpuKBjasXa358ZixvZRgA34VdJHJ3w5uayARjKlw7dS0KWOME0EgmDrenGjOJ5wUoW1MZy+B5zQu9cX9D4y3e+4IJNi6/93yPhdBQy5DdQ9kQSAJIcmzt+az6bQpUjmugUIuox87FZ8pqH0UoDbMZHVhPiw96ul4VnGfvPhRw4sjlNYDkyM2w6hYcwpCdPDv33QenUqlxVjWc/TD73b8bzZos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(478600001)(7416002)(41300700001)(8936002)(86362001)(316002)(6666004)(2906002)(8676002)(66556008)(66946007)(5660300002)(66476007)(4326008)(38350700002)(6486002)(36756003)(38100700002)(2616005)(4744005)(52116002)(186003)(26005)(83380400001)(6512007)(6506007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUQvRDZEaytJKzErZmV3M1k5STV1NU5NYk0vOVlWK0VWaWEyQVd2anhXU3U5?=
 =?utf-8?B?T1VEYkJEMTR5ZEViUGJmbDBjaVdaTmpHNy9URUN1YlZka1dvaG1UeHgzSEZO?=
 =?utf-8?B?Q0F1c0d3ZS9EQ1FMbDdkYXBIOFlPc0ZieWp1U05nSlpmaHoxNFRRdHNiQjJm?=
 =?utf-8?B?cERyMk1GZG5laVVMYVpOM3FJM3JacGpTTDZBSUdLMTFOOVFmZ1ZzUTQvZXp0?=
 =?utf-8?B?bThWbHhOWnBmZHNFOWhTcVY1U0g2TjZidUFrNzF1U01DaHl3K0FqMWVEenZV?=
 =?utf-8?B?MUNQSjBzZWpFU0JmQ2p0VTNYYkErcFZBa0hGUVNPSDBCZWY5MWVhbHdENDBV?=
 =?utf-8?B?UThmbDhDK0UzdUh3azZ5NFJLWDVWMjJvNnFkdXMzVGhiSFlVRjVkVHZNZ2ph?=
 =?utf-8?B?di9GV0dKaFg4S2g0ZTM2Nlh6NlNDcHpPNmZLbVQwVXBXRENiOFR5SnVkR014?=
 =?utf-8?B?YWVhT1FzNUxyT0NlcW5wb3RxbUtiaUJzU1N3RDhKc0k1MXBKZXZZN3hlRThz?=
 =?utf-8?B?VTA3VTBUMUtVVFZpOU8rMkhoelRGd01HUEZ4eXB5YmpKN3JUeElRTmxLVzBO?=
 =?utf-8?B?bFdGdjF4VnFzUmhWZUNha1FlNDRjWEZPbHNON0UvVzNIUmUrNEwxQkE4MVBq?=
 =?utf-8?B?RVdyMmM4VmUvQXV4NWZmeVhrQmlRMUV1VTZDVzdyeUhBeGwxUkJ1eVZiWitJ?=
 =?utf-8?B?M0x0M3VKZTlkMFRjZHVnYzZCUGhyS3d2cFZ4cEtzcGRNNStSNlhneElRb3pJ?=
 =?utf-8?B?aE95aHZkRk9ua0E1SVpIcUF4WHNsM0NWSVBFWVNFaXhieUlQRDJJOXpZa0hU?=
 =?utf-8?B?NWVNYk4vQ1lzK2pqc24yS0RNNmRiaUxVRE93b0lTeE5RRWZNTlhxMFRCMnYy?=
 =?utf-8?B?UWU5RUdkeWdUYkgzcVU1RmRnd3doSmZxMlkybi9LZEE4TFBEUXlnRURlZ2Nk?=
 =?utf-8?B?L2owbU82MC9IRDhRaU9jdmllVFVMNGVoNE5mUDJDWFJkSWRITHFSWXJBTXZK?=
 =?utf-8?B?MDR1akl3ZGthckx2bHdMaUtibC9abmlqUFYvbnNlQnViSEtZSFJLVWl3TmQw?=
 =?utf-8?B?aGhvWE9IQnp3Y0JZUjEya2VvTU5vcTNlZklncGpVMnJSb0ljR29WUzhBWkhS?=
 =?utf-8?B?MVJ4VzZLSW15Vlo3LzBhc3pFdEJqcklQenh2eVd2ZEtQZFVnS0k2Y2NmNi9l?=
 =?utf-8?B?MEdWbkNrQ2E2eG0vTVJadWZWeWQwdExmcmdSYjNpOVV5aTJwVXdzK1VnNlpq?=
 =?utf-8?B?dEx2OGNzZnVQRkxwTlJxLzBJOW13Z2ozOUM3TTNacXhLR0dUbGVKaWxCR0Fp?=
 =?utf-8?B?OFlOOG00eWZOSkdYMzJMUGNORWdWUVIrRjNBa1ZiRURVTTNxVzFtREZPaCt3?=
 =?utf-8?B?SWt1WWpySlFNUlhqV2dUclVHVUs0U2h2K25hdy9rQ1BEaWdqSGEzTlBESkJU?=
 =?utf-8?B?eDhhY0ZqQmJ3YURKRWZWd2lIOUI5dTZjUU4vMnF6ZVhtckJOcUdKaFlnTEow?=
 =?utf-8?B?ZWI2SUw0MUgzdWl2Sm9LN2NOSDdvS044b2dtaHhOUldGV0JvYWNXU1c0UEo4?=
 =?utf-8?B?MTBYcnhJbEhOZzV6OGNhSkdiWjFpRHVUN1Q5cUkvOHZacGVxTEY4TWdIQmti?=
 =?utf-8?B?R09YODJTcnNBWkR6bUtjcGltRXIwakJ1V1ZueWJMOUlnSkhuM3E0ZUp4TmhK?=
 =?utf-8?B?MWRRM1NyeVpOV1hzTHY2Wng0NCtDbkRQMHNtb0tpajBoeEVDWnZpdE1CMTdo?=
 =?utf-8?B?dnpxMEVHMGw2Q0x6eG5JekhVMjBTVXBJN0RrTjhMTDRPQVJvWmk1UGxHQjlS?=
 =?utf-8?B?SXFoS202eXp2ZnNBbE1INE1UWHc4VTVRYzUzM1hyMWttZ0hVTnc1Wndac29H?=
 =?utf-8?B?L1JpSjVZc2V5OVVFaExaZFFNZ1hYbDNCWkMySWpnWXFaWGZ2ZnBFdW1sTFk5?=
 =?utf-8?B?dHlXUU0vRDRWSkx2dWlsMHVneUxzcEpEUDM1RlBxQXlXeWZMWkpyYXB6Y215?=
 =?utf-8?B?YnBIdUVTalN4S3VGb0x2UitVb0VGN1pNcEY0L01NY3ByUUE2M2ZaYUk3UEJT?=
 =?utf-8?B?SXhQUmFXSDJDMkxLYk1zWEFqVFJrMnFRQTVOUEVMcnUyWkM0dmxKYWt2TEx3?=
 =?utf-8?Q?9quyxqEubscZ+mQp1I6Qk9S3E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126e7433-21f1-43e3-703f-08dab71e1e30
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 06:48:41.2238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvE1yZVSjXl9dqgdmjIs6GeOCAwS2MaHa7l7OJQ8t9H/kmHOifFE0FOSmtc6tvNJPOQaY2btri3EXcooyoj+5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8434
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
Cc: tzimmermann@suse.de, s.hauer@pengutronix.de, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On Sun, 2022-10-09 at 10:35 +0800, Liu Ying wrote:
> A duplicated line 'select DRM_KMS_HELPER' was introduced in Kconfig
> file
> by commit 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER
> option"),
> so remove it.
> 
> Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/imx/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

If no objections, can you please pick this small fix up through
imx-drm/fixes? Or through drm-misc-fixes?

Regards,
Liu Ying


