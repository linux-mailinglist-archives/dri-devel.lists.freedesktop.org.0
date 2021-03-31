Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2489D34FF41
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E596E1EE;
	Wed, 31 Mar 2021 11:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0C66E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 11:08:27 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VB0A9A160920;
 Wed, 31 Mar 2021 11:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=YnkJvQjiwChlKoLH79Aqt8ub7e7VQL9lAuTuZTigx1A=;
 b=Nh38y+BNnPljjJGhwBARNLG6R2lvgUrBf2MtrOSxLvn4TGoM+97Ia3GIFX2fbLxuVq6E
 OFQalqw9L+pGGs+m8WrCdagy5sZgGLQqA6JiNRgGTR0FbElTMSP6fpTlUYvbWvoeWVA8
 uGb5ZkEQEszAcOrwW015Rc1u21r8+luroBLmTmISC/W3l1fL+avXqPu2VcmaAma47Ys9
 f3uDVCoAC6gu7aZTCayfu/cFBD8cRUPRaQ7PI6sel5N/cG70wGNVgiuYAemX/jd7Jr6j
 zSqple2ZY1uH+rJDRWcUMdpTCrfq2eOWiPwdDlYlz4POz7OhZm5A4DEH0JUoFM3DfDNR UA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 37mabqsurk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 11:08:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VB4r7B091997;
 Wed, 31 Mar 2021 11:08:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 37mac8h6hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 11:08:25 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12VB8OZf030282;
 Wed, 31 Mar 2021 11:08:24 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 04:08:24 -0700
Date: Wed, 31 Mar 2021 14:08:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [PATCH v2 1/1] drm/bridge: lt8912b: Fix issues found during
 static analysis
Message-ID: <20210331110817.GL2088@kadam>
References: <20210331104312.328820-1-adrien.grassein@gmail.com>
 <20210331104312.328820-2-adrien.grassein@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331104312.328820-2-adrien.grassein@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310081
X-Proofpoint-ORIG-GUID: IrKj8TaOJqJ-Ru6ODB4_Z_hof78B3jWY
X-Proofpoint-GUID: IrKj8TaOJqJ-Ru6ODB4_Z_hof78B3jWY
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310080
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

On Wed, Mar 31, 2021 at 12:43:12PM +0200, Adrien Grassein wrote:
> @@ -635,13 +636,16 @@ static int lt8912_parse_dt(struct lt8912 *lt)
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
> -	lt->data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> +	data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
>  	of_node_put(endpoint);
> +	if (data_lanes < 0) {
> +		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
> +		return lt->data_lanes;

return data_lanes;

> +	}
> +	lt->data_lanes = data_lanes;
>  
>  	lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
>  	if (!lt->host_node) {
> @@ -658,16 +662,18 @@ static int lt8912_parse_dt(struct lt8912 *lt)
>  	}
>  
>  	lt->hdmi_port = of_drm_find_bridge(port_node);
> -	if (IS_ERR(lt->hdmi_port)) {
> +	if (!lt->hdmi_port) {
>  		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
> -		ret = PTR_ERR(lt->hdmi_port);
> -		of_node_put(lt->host_node);
> -		goto end;
> +		ret = -ENODEV;
> +		of_node_put(port_node);
> +		goto err_free_host_node;
>  	}
>  
>  	if (!of_device_is_compatible(port_node, "hdmi-connector")) {
>  		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
> +		of_node_put(port_node);
>  		ret = -EINVAL;
> +		goto err_free_host_node;
>  	}
>  
>  	of_node_put(port_node);

Also, btw the success path does "return ret;" but it would be nicer to
"return 0;".

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
