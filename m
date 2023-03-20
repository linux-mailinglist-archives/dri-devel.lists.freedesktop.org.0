Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D479F6C2056
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50FC10E2C9;
	Mon, 20 Mar 2023 18:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CAN01-YQB-obe.outbound.protection.outlook.com
 (mail-yqbcan01on2118.outbound.protection.outlook.com [40.107.116.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D5F10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2UTvOi1eMhhu28d9b1pUa2Ipx0i/G3wpukcmJoxOQfyMMqoBP1YBUflPkfQMB37TDLCmqEPe+0NkCwoRkmCg6iR10FHDkNHx55McZlFJbJBTheG32or58JtdBp6fSzMR9UrFc4hhIGxokvxQZSacNKQenOTRFj2S4nCIXM4J6q6dH/oGObFH2m4uzArgs5kFHsu3/0WDpqeoK21IjNbRL09tgJMmPSARKpWNvQn5TPeeamPBMKXEAb4H0lgj7xAwmPj7XVXGuc/5QJZaeKovxCOKSYP2pKU+EyUNt1OOSyjnHXy1XYozuMRpzaxfOg+fuSmhqyNagVv8BUI3jFCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af8K/5VzibVTaVCBhNwz4BViPhZT3cdMN4YvoNB8zYY=;
 b=DXhuFi2wdUNiz6YEct47noFYQEzNdBEtd3LlZ+tGYJs7KABGyW0eLzwZJS5+TWjs4D3YbOFjqL7z30fMlN1iJBdb8o2TFSCLdLrV0qRdB0JY+Z3zzbmMdiTVqKRTz9a++rEmtkVDzW9W09HFUy3Hn842c0Y8lMSFGnIxdyORudmyeVLulGra4Zer46XmvRS5qBCwrL8dDbILIbmtHQPR4rrhF8qvC8VQ/6MwKXO9FMG8QvzL3OLL4BpIDl8ZK8ITi9WB5JflOegt1MOO2geTB1Itq1oKgOQWkDGg9n5ybHcegctcCGi33gxsKVMnENQvWBrYOe0M+MP/bquTihRhNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenbrook.com; dmarc=pass action=none header.from=lenbrook.com;
 dkim=pass header.d=lenbrook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenbrook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af8K/5VzibVTaVCBhNwz4BViPhZT3cdMN4YvoNB8zYY=;
 b=guIjs1ikgjXgMWmBiC9HitQYle0O4W4As4UDcxFfz8eK+TB8rB75oCjYVVrWlpQ+Az9ZyBfHeS6Kph7HQKjTfFiiyFTNfd/SIMUQl2Ir73Smsorqr/VweBto7xqDQTT/YVKQRJl95JSrVKEabQpIxnNHjRetCFBaRJ0PQdFtIbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lenbrook.com;
Received: from YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e8::12)
 by YT3PR01MB6360.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 18:51:02 +0000
Received: from YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2a76:b922:37e2:e1d2]) by YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2a76:b922:37e2:e1d2%3]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 18:50:58 +0000
Message-ID: <13f6d07a-340d-a438-8648-913bd42d8457@lenbrook.com>
Date: Mon, 20 Mar 2023 14:51:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/bridge: nwl-dsi: implement MIPI_DSI_MODE_NO_EOT_PACKET
To: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230318223357.3899-1-kgroeneveld@lenbrook.com>
 <0f183988-f100-c4ff-056e-a737767a772d@linaro.org>
Content-Language: en-US
From: Kevin Groeneveld <kgroeneveld@lenbrook.com>
In-Reply-To: <0f183988-f100-c4ff-056e-a737767a772d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:e8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB9670:EE_|YT3PR01MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6b5d74-f68a-4b8e-2030-08db29740b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYgvY3/9YtWhpz2bXXhXHT4WFPuDbkW3TnizsaQwunvQnyHtc7sx7a6GZ837LNG+3RPTMZhV/ko+ZIZWu18asxDK3fGQMtN2rnV+uekRojwMht0nqA/pMj6kvJl8InI0Dwh/DEdgmE8k0tWt2tEkNCaUA9OkeBqmt0A6vIxIThG4lVmjhQyI4Tvty//u4ooiacjRbHEYIw6MNsE9n2aJWkleSHnb99rYeDEZmIoYH1X5frVjy722IPKsFAOKasbcUKyuL3Zf2KtoogXR9GnJV6WFACy0/BYWPfe1EK3mAffBtDOufis0evPjv0O0TP26AgqLjTbWY8zxNT/l/l6/Fqw9dYnYehOia2VaoenZtL7X5F+9jF/z5ftACV5Bi5qC1kHSF1oYEsRviIoeZgx2xdITRRLk/1f4oStvcxAKa/imGU03yoRrta4po6I4YoPZAGKXoOFvLAxFKeVRCaqY+73b4HKgzbCLdqPTK5lwxo0yuHN9vuaAWmd04pyrLsq+5gbhNS3j4ScvBHbBH5qrl4Fj9FErGhA51/quuQKIxiH3xjCavCEpXHm5spjQSVRloSZHSS+PgJw1Bw5cF7R6MRN39lFqssHV5L1nm6/UUbeGilEQoFmfC7j6rG1PKldf4upHKmDL2qgd5njujwzhiGeXZ/fTtTbxgcR1cvemcd+B2uH1ZYk6jogUqBZoyND6tIfcCjmuoeZPD6eKnji3puacBVoprCbw71kmdm7GkbLk2ADx7+PW3W59moe0j9Js
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39850400004)(366004)(346002)(136003)(451199018)(86362001)(38100700002)(31696002)(4744005)(316002)(8936002)(110136005)(36756003)(66946007)(66556008)(8676002)(7416002)(41300700001)(66476007)(5660300002)(2906002)(478600001)(83380400001)(6666004)(921005)(31686004)(2616005)(26005)(6512007)(6506007)(53546011)(186003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUFRVzQxVWZ0ZjllaExNMElCVkhLTU1HalQ0Ykl2cHkxa25tcUtiVHcvZ2ZU?=
 =?utf-8?B?NnU1WFhwaTFzSDYvQmtMb0htUEE4SDhScTQyYWkvcUtpUTdCZ1VIN3JRTFhv?=
 =?utf-8?B?YXk3R24zZ0dVUnZkWkhrcURoK0FEb3FDV2RzV1FBdGJLQUhJYUJxclNpOTJS?=
 =?utf-8?B?UWRmekkyK1VaSmhXaVhHVVl2OVVmcVQ0R2lIYWp0Y003My9sRjBNZ003TG5L?=
 =?utf-8?B?cWFHbjVnNnRSTEZONHBLcmJVaGR5S3VoVTBWNHFtak42K2UxeG0vRmZtODdB?=
 =?utf-8?B?dDlucXJaUWRtRjNMeUNhTEI1N2hQMW1iZ3YxRmZFaFdqVUxzS1R0TUFERFYv?=
 =?utf-8?B?WXhjTys0d1RraXRrdmNhNE9sTlY3dnprTFNMdjdad3JaaWJ2NS95WnZKclNr?=
 =?utf-8?B?K1RtYm45TGxtMmwwNjg2SEt6dWJUSVQyK3o0cHdCc2x3azV6UUNJVjJXc1lF?=
 =?utf-8?B?RXd5YUxyYUo0TzZxcENtRzRhYzRhWkIrVzRaWW9uaTlGNW81akR1NzN5MnFC?=
 =?utf-8?B?cG9WampCYnlCSjZUeGd6ajdqMXJnNHBqNHVQTUhrUVc4MkRNc25GNEptNXA2?=
 =?utf-8?B?YnZyczduekJrNWxwdHdwWmk5TlRCdXNxQ1hvNitmblZrQXIvczgwcnlNbWta?=
 =?utf-8?B?Y0dGZW5wYXlrUndFNDU5QXRNd2w3WUcyZFJsRVFqWGZPOStMWngzM2xMREFO?=
 =?utf-8?B?VGxYaG1OYXVHZ1VYUnZqVHFTb0R1VWoyM3pWZlYxcUpIdGxtWlBvMkV1dW1J?=
 =?utf-8?B?Ky95QVVic2dTNDBzbGJudklnUHBDb0tKRjJCa0Y2aytHR1JpTnlJT1Z5NlQx?=
 =?utf-8?B?SU9YZ1dndFg2Qm1zSDdjQXh2ckVCdmd5Um5MbTRXREpuYWVBa1k0cUppU0sw?=
 =?utf-8?B?bjdrZEhuVzlLaXpvSW5WR2tUMU1ZOTBsbU5yT3Y5TXJRdEg4L3FNWTBSaEpj?=
 =?utf-8?B?UjA1a01YMjM0WVp5Mk1vSDN4a25WaDM4dUYrcWhaaVlXZ0xaSkZaeThldmN6?=
 =?utf-8?B?ZmUvTVg5Z2Y3eFpTUFZQRGdpbnBEY3lyWnlkQy85dkpRRmpTVzZPTnVqTkJQ?=
 =?utf-8?B?NmpXVFRkSUJ4MzJQSnJldkUrUG10M2Q5a1ZNZW9iTjc4Um54NmVDMVZJcnFy?=
 =?utf-8?B?UnRQYW5FK3ZJMDVrWWhZdEFwVkpoRGt4QW9oZlVuTkEvVEhPTUZGelV6Zkg3?=
 =?utf-8?B?TkgvWElTdHQwTDhzOGR3Q0xteldHcFk1V2ZENlpoVGxwOTFReUFYVnVLNGxC?=
 =?utf-8?B?QlBCZUNXdllSMFhodDA2S3NBRGF1TUVDOVBOM1RTUlNDZVgrOWNZOEJOY0Nk?=
 =?utf-8?B?RDdZM0dndFpXeHVkeThUdjRTcVFpOCtnRG5uYlhDMUplSDRKME4zZjdIeVhG?=
 =?utf-8?B?bXNPTlhEVmdrZmh1Sy8xMWcwL1VhUkg2dk91RnJXYXh0b0RYck56YWhlWXZD?=
 =?utf-8?B?bHRkelZOUXBGZDZYcDlFTkJjbGwxZGo1VitveFJvaUJ4cWNVMEZwYk5uL1Rp?=
 =?utf-8?B?U1dRaDhxQ3JuZ3RjbFdWcmh6ekV5YS9OWW9SWi9ZTitQM0xvdkZnUWV6YTl4?=
 =?utf-8?B?VGhZUXFHbUN3TmpZRDdlQk5Zc0tONndPcUtaU3BYZThleUtPanZvWndJcEIy?=
 =?utf-8?B?dDBnMWNCWm9FdjNwN2wzOE5QNmlIdjFJeDM1dDZTV2t0N1J6ajgvOWdHdDht?=
 =?utf-8?B?bjA0NjFndUtpaXpNTkY0SmZTMTU3UnBmZjk0bzhzRnNFc3pzdnVEU1JCZkVp?=
 =?utf-8?B?YmgyOCtNakRwanBSN3lCaWVucmxCOW00eXVTd0RlMXY4MkNGeEVpVGNBUkFR?=
 =?utf-8?B?d0dYQ21TaU91czl3N2tVSHpoQWJKZ1QxTWJGZnlTZ08wSTZEb2VENDV0YklC?=
 =?utf-8?B?L0pDanJ3MDBjRUxkOUcxdVFBS21OWHBRMmkwbWRLTWJrODlabGg4TXkzSUFN?=
 =?utf-8?B?Z0JYUmFnRWNkdEI3bDRRM2FXNlh0L0lDZzE0ZExibHMyM2s1dnkzbUV3YVY0?=
 =?utf-8?B?VUFrZHZaZy9adUpnZVI3NmY5RHNxWlluUXlWeGdDNTJmRjhIT3NtU0JYWjlY?=
 =?utf-8?B?MjQrdjJzVUxoYVZKbS9tQ2JJcE5WcmNmY09xVUZOam1NdHN2NDZmZUxIUDVq?=
 =?utf-8?B?OVpJQ0h0N29vY2h5cU1ldHpOeVFRSzViOFVzdDdrdmUxeURybmZFM0wyNG9F?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: lenbrook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6b5d74-f68a-4b8e-2030-08db29740b19
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 18:50:58.3448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3089fb55-f9f3-4ac8-ba44-52ac0e467cb6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCXb6J2wW1bJCfQq9eWY6P1jHAVcTVF3gsC1yrLUBJmEjo+wCQhGM6kqpohtATF0g/C2aBFAs7/g/r0jIVlAfkRYEpOVPPESrEl+QYhTZX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6360
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

Hi Neil,

On 2023-03-20 06:43, Neil Armstrong wrote:
> Thanks for the patch, can you provide a Fixes tag ?
> 
> Neil

I never seem to think about a fixes tag unless it was a regression. This 
limitation has existed since the first commit for this driver. If there 
should be a fixes tag then I guess it would be:

Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")

Kevin
