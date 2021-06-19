Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9433ADA2A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 15:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093BC6EB15;
	Sat, 19 Jun 2021 13:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3276C6EB15
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 13:40:48 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15JDV3LZ013262; Sat, 19 Jun 2021 13:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=hS26YoFHdPGYMTjYz8IS1maG13YzP8VVING5If3ikhs=;
 b=CUrBIQbFa6V5W2tfroKTaDubn/yoBCtm2+Q9cHXtUE6KDHiS+KRAAeav6XMYlBEo1AnO
 2WlEyswrxrabeJ6MULZp1XThSHma6NCwIvngqgZI5h3ts7O5kQaE7WjnA4bv4jmTfjnj
 k5UTCirkVPofSZPk9fKJYRDVsgZUmHc34tcRgdmVpDE8FbrQkvWSjPXDvHDLt+BoGqiq
 h5JGFyAqqr6pqcnYXobZtZZRiabffk/kuQ0bCsG2khuH4XIeRkx+j5Pzgcd+odVgkF4T
 zRxw7NxeyHGZOfOhnC5us7XL53bsvOXOkfI8LSDwUpGEqhyix9Zlqj8HcHKWkuT4gOZv Ag== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39994r0dcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Jun 2021 13:40:43 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15JDegtZ005639;
 Sat, 19 Jun 2021 13:40:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 3998d2uvyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Jun 2021 13:40:42 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15JDegDS005628;
 Sat, 19 Jun 2021 13:40:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 3998d2uvy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Jun 2021 13:40:42 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15JDeXN7016087;
 Sat, 19 Jun 2021 13:40:34 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 19 Jun 2021 06:40:32 -0700
Date: Sat, 19 Jun 2021 16:40:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/gma500/oaktrail_lvds: replace continue with break
Message-ID: <20210619134025.GH1861@kadam>
References: <20210618183524.590186-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618183524.590186-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: Ih5-7A04RWlqzQ8H2vqzh7-dD5qJe8qd
X-Proofpoint-GUID: Ih5-7A04RWlqzQ8H2vqzh7-dD5qJe8qd
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 07:35:24PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a loop scans through the connector list checking
> for connectors that do not match a specific criteria. The
> use of the continue statement is a little unintuitive and
> can confuse static analysis checking.  Invert the criteria
> matching logic and use a break to terminate the loop once
> the first suitable connector has been found.
> 
> Thanks to Patrik Jakobsson for explaining the original
> intent of the code and suggesting this change.
> 
> Addresses-Coverity: ("Continue has no effect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/gma500/oaktrail_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> index 432bdcc57ac9..8541dcf237eb 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> @@ -113,8 +113,8 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
>  
>  	/* Find the connector we're trying to set up */
>  	list_for_each_entry(connector, &mode_config->connector_list, head) {
> -		if (!connector->encoder || connector->encoder->crtc != crtc)
> -			continue;
> +		if (connector->encoder && connector->encoder->crtc == crtc)
> +			break;
>  	}
>  
>  	if (!connector) {

This test is wrong/impossible.  It should be:

	if (list_entry_is_head(connector, &mode_config->connector_list,
			       head)) {

regards,
dan carpenter


