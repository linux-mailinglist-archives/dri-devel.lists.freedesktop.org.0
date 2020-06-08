Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82421F1E8C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 19:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5396E98F;
	Mon,  8 Jun 2020 17:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FF46E198;
 Mon,  8 Jun 2020 17:50:04 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058HkRqb105840;
 Mon, 8 Jun 2020 17:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ncmODzgoWtkudobrbPyNbaCQiNZTBtUZcMm2aBJK4rY=;
 b=UuEoKDxNP+ztqskyqBSLAZeRHX/MII4zJX50QQxw3OyFF98b2mzRdMAAggZoRfdhkbIG
 60xQ2pzWRJGwmq87x+AKYqJ5froms2rt9AWRDvsx373OhEpOzjEERAqZJWnxrO6Ypnty
 9xUgiGaE0XO+IeV9dA8cD/BTCfuG57i+kJpDihEriQhiMGhB70xrMvBZm2xqBWDoSa31
 w0/E5DCFhCJRq+RmZG/yE8MHACizqquEyAOy+at+nJfi/x4/WZ/eRVwGL7eoFh1N/XLK
 5VegiooZX6qTk8h5AZkpjWJmBdasjFcTO8VyA6A9ptmQpjTb1M+Hg3oSDoI6Ac2dRRJR sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 31g3smr3t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 08 Jun 2020 17:49:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058HmJeL135601;
 Mon, 8 Jun 2020 17:49:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 31gn23fgd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jun 2020 17:49:59 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 058HnqxD022415;
 Mon, 8 Jun 2020 17:49:53 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jun 2020 10:49:51 -0700
Date: Mon, 8 Jun 2020 20:49:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drm/amd/display: Fix indenting in
 dcn30_set_output_transfer_func()
Message-ID: <20200608174943.GU22511@kadam>
References: <20200608141657.GB1912173@mwanda>
 <dcce7f702c674999c31fd358c3970d5fee1a6725.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcce7f702c674999c31fd358c3970d5fee1a6725.camel@perches.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9646
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006080126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9646
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 cotscore=-2147483648 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080126
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2020 at 10:16:27AM -0700, Joe Perches wrote:
> On Mon, 2020-06-08 at 17:16 +0300, Dan Carpenter wrote:
> > These lines are a part of the if statement and they are supposed to
> > be indented one more tab.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > index ab20320ebc994..37c310dbb3665 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > @@ -203,9 +203,9 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
> >  					stream->out_transfer_func,
> >  					&mpc->blender_params, false))
> >  				params = &mpc->blender_params;
> > -		 /* there are no ROM LUTs in OUTGAM */
> > -		if (stream->out_transfer_func->type == TF_TYPE_PREDEFINED)
> > -			BREAK_TO_DEBUGGER();
> > +			 /* there are no ROM LUTs in OUTGAM */
> > +			if (stream->out_transfer_func->type == TF_TYPE_PREDEFINED)
> > +				BREAK_TO_DEBUGGER();
> >  		}
> >  	}
> >  
> 
> Maybe the if is at the right indentation but the
> close brace below the if is misplaced instead?
> 

Yeah.  I considered that, but the code is correct, it's just the
indenting is wrong.  I normally leave drm/amd/ code alone but this
indenting was so confusing that I though it was worth fixing.

There are lots of ugly stuff which is not confusing like this:  (The
line numbers are from next-20200605).

drivers/gpu/drm/amd/amdgpu/../powerplay/amd_powerplay.c:1530 pp_asic_reset_mode_2() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3387 bw_calcs() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb.c:104 dwb2_enable() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dpp_cm.c:450 dpp20_get_blndgam_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dpp_cm.c:543 dpp20_get_shaper_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mpc.c:306 mpc20_get_ogam_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:1519 dc_link_dp_perform_link_training() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:3137 core_link_enable_stream() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:207 dcn30_set_output_transfer_func() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.c:650 dpp3_get_blndgam_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.c:747 dpp3_get_shaper_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp_cm.c:67 dpp30_get_gamcor_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.c:116 mpc3_get_ogam_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.c:432 mpc3_get_shaper_current() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2351 dcn30_update_bw_bounding_box() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:178 optc3_set_dsc_config() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2704 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:2777 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:2633 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5031 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5036 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5056 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:731 dmcu_load_iram() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:5062 gfx_v8_0_pre_soft_reset() warn: inconsistent indenting

regards,
dan carpenter 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
