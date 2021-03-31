Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4906334FE0C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A4C6EA3F;
	Wed, 31 Mar 2021 10:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FD56EA40
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:29:28 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VANx6i110114;
 Wed, 31 Mar 2021 10:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=mHhPM2iF3cW3ypy+L20dc8l5XR9z6/WOYKaPfXGCGUo=;
 b=xuvwfmW2QlBrjsL9S205jHQbarFFQOMRD5OABbjLSxoId4a8SnG6fZo4OeFzARf5PFsP
 tYD4uqusjBS9ze0I6nyAefMJpNGYV9Egk8+ybssKvSTblS7FroYgrB4qKfWjRQaBEv0/
 s10jJjXB/PFQ9RAc3rY4D7AjfYcbYlHsyfxJjyzVmJBU+I2sE+zEa2w8urZ9D4KQZ/eL
 Vvf/n9rIRTHuzVnVdNpzKnfdQrKhHCyFKlOycMJazFHg9eTx6+yK5Y7wpfVWNoKDYuYX
 n/3zW2Pxq78fDexhrAXSSh0I2aALZG4XIP8XDYHgnKZz7S6COFEkmtojMYo3nbOTuVoM kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 37mabqsrw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 10:29:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VAPtq4101593;
 Wed, 31 Mar 2021 10:29:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 37mabp839c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 10:29:24 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12VATNpB000357;
 Wed, 31 Mar 2021 10:29:23 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 03:29:23 -0700
Date: Wed, 31 Mar 2021 13:29:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [PATCH v1 1/1] drm/bridge: lt8912b: Fix issues found during
 static analysis
Message-ID: <20210331102916.GK2088@kadam>
References: <20210331093822.251839-1-adrien.grassein@gmail.com>
 <20210331093822.251839-2-adrien.grassein@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331093822.251839-2-adrien.grassein@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310074
X-Proofpoint-ORIG-GUID: GYL8ZfSYukBy0iHvR0lyJWbWhCgkP04J
X-Proofpoint-GUID: GYL8ZfSYukBy0iHvR0lyJWbWhCgkP04J
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310074
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

On Wed, Mar 31, 2021 at 11:38:22AM +0200, Adrien Grassein wrote:
> Some issues where found during static analysis of this driver.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Dan Carpenter  <dan.carpenter@oracle.com>
> Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> index 61491615bad0..9a5a19655362 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -635,13 +635,15 @@ static int lt8912_parse_dt(struct lt8912 *lt)
>  	lt->gp_reset = gp_reset;
>  
>  	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> -	if (IS_ERR(endpoint)) {
> -		ret = PTR_ERR(endpoint);
> -		goto end;
> -	}
> +	if (!endpoint)
> +		return -ENODEV;
>  
>  	lt->data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
>  	of_node_put(endpoint);
> +	if (lt->data_lanes < 0) {

Ah flip.  Unfortunately, ->data_lanes is a u8 so it can't be negative.

> +		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
> +		return lt->data_lanes;
> +	}

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
