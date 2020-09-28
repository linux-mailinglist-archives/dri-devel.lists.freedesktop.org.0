Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D72627AFAB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 16:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08EF89F75;
	Mon, 28 Sep 2020 14:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD16389DFE;
 Mon, 28 Sep 2020 14:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctToyE0t43lAgaE1GQuuyXIbLOb2wZcylUy5X5q8DdWR+yeO0T44m3PNRHzbU/5NH1x/GoT0r0gZma4wwb2lHCVvre2+E3JYcGyTvcXbZ3aZOYTr5E1BZu1atHzuTCmdKlvsn/4IZtWZ9ecimv7d/TWkdtwYiGD2CSDzwMeXVYfOtE99tx97iupIsHGv5BCo+C0oSsa4GVhDL/OKhqUzC9+GIhpDtDIEqTBClrquHFXKcu3Sv+WD6FjbTPWm02/flxyAns2jzMLxu9b7moy4fM6GBdWi2EOcAajk0AAnKwLgcyzOwZ4pHTBDp4YiyIinQjfFF5VGWaw9L03iBmX06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcOY+8k9AbmCorEISpddzqjXY9YpYQ+VfRR5VnYfS3U=;
 b=gM68RzRkcm/JcYGf4IfnI30hDVgCkIO5K/2CrXO2samm2+hW0ThAlO+pljQxJPl2iXitPF0C0ps2wikh7/7omFlPiDScoeihUDtux8k199RMqcCTOF6WgSoOq9DZYU1M9YwB6aORX8FOQAiSI8uV2PhCCPXA+ngklhMuGswL0mada161VcZw63qv2tqmX2fxL4amsNbGBu/sJx6+KfFNLEisdroJwX9lR95IG5S/7qBCaIx+EwheKt5S6wacxDaAGFszx+vDy0tyCcXeZHIanyZJDF03AicjvZyfQQf2chITI92guUyNywnfYafum61L0CxfkWuJ9pAtBGbQlClS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcOY+8k9AbmCorEISpddzqjXY9YpYQ+VfRR5VnYfS3U=;
 b=mm83iIvRIKRwKkXtP7IbN9E3/tMLgMoS4fBTD0PsCaI4ELp9T1Lhm8+rn6OGMbmbC/yPHyRDj1JEZGtBYQrhgnqyjLjH29+Ay1s63PtmHgeu7JDUzO0Kfhyp3p7wh89bvyVdtCbOUpmGGkKgw21QQ/XRCkl9GYsSM0L02sDlFHg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1293.namprd12.prod.outlook.com (2603:10b6:300:9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Mon, 28 Sep
 2020 14:06:27 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe%2]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 14:06:26 +0000
Subject: Re: [PATCH] drm/amd/display: make two symbols static
To: Jason Yan <yanaijie@huawei.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Anthony.Koo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200928023543.70093-1-yanaijie@huawei.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <bd4d89ca-a9e1-e49d-c9f0-fe5cd07daec3@amd.com>
Date: Mon, 28 Sep 2020 10:06:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200928023543.70093-1-yanaijie@huawei.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN0PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:408:e4::31) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.135] (165.204.84.11) by
 BN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:e4::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.24 via Frontend Transport; Mon, 28 Sep 2020 14:06:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49b4d241-5eea-4fbd-b1d9-08d863b7b093
X-MS-TrafficTypeDiagnostic: MWHPR12MB1293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB12938BE9129502AA8DC7BEEC8C350@MWHPR12MB1293.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:52;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojVBoO7W/xW2pboQrc3PfCMAm6pfdrYcsKV3wgM8p4zkoRXWmeomUPzKaEO+YF7B7XYLIg0dzeptgS4zr/kfT+V8JlFraZpYHhb+Yp7J22Qtw5lnnKGPcTcPKeG5cm+vGbb8YwOwfmn0I91k6da+01wxTNDXEmJ/l6dn5okoORttqD2SJxX3YKst+ZSGhQY0TPrQ9HciI2W+4iU6rqvYYEfacoItUvbNsdk10Hi1i+wJ2wViCzg11X7yEX/Lqmije/I5C+miT8muG3+hjzQUWGm1yX7B48Zv/dM0Q8S49b3YhlxksZrABdOIOqz88Gk1oTlUmL/6qNkK10X4+A2mAogXG2Pe8hn2cHf43b0Glh/+kTLzodh1e8jYQQ2Y6MyyRaUJiJMYkFQkKfLosyi5wnyK5e4DGB2SNBmauHZbWGmh8GCLKg8YL9T9djeNQulD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(8936002)(316002)(6486002)(16576012)(86362001)(8676002)(44832011)(66556008)(36756003)(53546011)(52116002)(83380400001)(2906002)(66476007)(5660300002)(478600001)(16526019)(31696002)(31686004)(956004)(2616005)(66946007)(186003)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ofznIhiAa1j5V/JWj7AAn1mPibmJ1xfqKUgXWIdo/D+DyuFNdGRwgAXPbhoeyvuhp4+s+M+9NBgsrDwXaeOjr6stQ9uYiTPY66OcsqG/hlvRUQ/bbFjGo3YXpsMCj72dL8wZawsASV0SymxRwQHP9/o9igtusdjzVhCVl+LSxa/YFLt4cKWCxrIFVIVhuRpIBgPAYP6bJOVMo9N1okozQOvhWtN/JZGPT+3/FpkVin6uo5flY34E6g0FQofYyANePNhpsrubhYWVCBxChHpTkANVKVnrtNrLaibisLVptv1sIZ+QPpOoGNVgfqb73Di7psRvmEpdiYP3P4zyZiYdpalB9FS99+rMqVbFIY7TO8Hz1XDSTAdB5xhqttHOtCFgUTciWOwoGpykysuT6T6oM7NrwV/g8u3fSjoSiXWpmBehgwtq+n9IZ2XQQXst5OJ158TD+Nhka8fjjl0u1ntqat4fFD1UoxzXYm5xJRTrUvJQcijc9mdr9blH4vqq4lq03gEPufRZM4MSIXepYnzjzyMdR9l/LIqL8F/TcHnncgML7wCgMnLxNdX2bPDkTUzu7pyZ2mYKExYJOQiCScGBDx/3sInJ3JGsPr+nsSy3l6hBl+xitdh6aZ+SZJMBr+aVZs7AkD4Oljf3qNBthfKOJA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b4d241-5eea-4fbd-b1d9-08d863b7b093
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 14:06:26.8148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijWOZ8vczWaPT2oJvMAX8dBHGkk7vmjpBbCzAua0Gst1f6e9VjhEee23rlyk2pzDTC0ENoCJt4A1hZ5gXcKJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1293
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-27 10:35 p.m., Jason Yan wrote:
> This addresses the following sparse warning:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2740:6:
> warning: symbol 'dce110_set_cursor_position' was not declared. Should it
> be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2785:6:
> warning: symbol 'dce110_set_cursor_attribute' was not declared. Should
> it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index 1002ce9979dc..31a8d3452e83 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -2737,7 +2737,7 @@ static void program_output_csc(struct dc *dc,
>  	}
>  }
>  
> -void dce110_set_cursor_position(struct pipe_ctx *pipe_ctx)
> +static void dce110_set_cursor_position(struct pipe_ctx *pipe_ctx)
>  {
>  	struct dc_cursor_position pos_cpy = pipe_ctx->stream->cursor_position;
>  	struct input_pixel_processor *ipp = pipe_ctx->plane_res.ipp;
> @@ -2782,7 +2782,7 @@ void dce110_set_cursor_position(struct pipe_ctx *pipe_ctx)
>  		mi->funcs->set_cursor_position(mi, &pos_cpy, &param);
>  }
>  
> -void dce110_set_cursor_attribute(struct pipe_ctx *pipe_ctx)
> +static void dce110_set_cursor_attribute(struct pipe_ctx *pipe_ctx)
>  {
>  	struct dc_cursor_attributes *attributes = &pipe_ctx->stream->cursor_attributes;
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
