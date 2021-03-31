Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E634FF88
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37646EA64;
	Wed, 31 Mar 2021 11:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AAE6EA64
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 11:36:05 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VBYfJo160049;
 Wed, 31 Mar 2021 11:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=JbARqWs2q6ZmtERtKLkF7uLngEkzZQDaMkI83xmDV5g=;
 b=gn+JwEJOdYScdsW3utwA7Fv7qE0Sl0s21YPZ4ucz1zPAsfwxljGMUfLTw9lFLrWyJ+kO
 tCiUw3UspmzVgkBkzRU4JpK8PFAe5g+nLDzyZPsTf3iyAT3pH7zHvMULXbmo36INFb2x
 fNNrVTuUFMGADmKJUD7B7QMwDrTboAcxvdF9RnhgSDGxZ6fAtlTpT+hDN1e51cD6+6K1
 Z49qxOXdQNRcMchfLOUGqON0cK0SePCzecssLmatvlKFbMqGClIBFp/GihvTsQrPpyM3
 aRkuTp6QJlVU96CyW2RSlwEy+vLubcDoX1trQqgiKLAyyHkHHpdtq1pgQVHZ8x8kx9AH dg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37mafv1w87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 11:36:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VBZcTd135524;
 Wed, 31 Mar 2021 11:36:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 37mabp9sqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 11:36:02 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12VBa28i011370;
 Wed, 31 Mar 2021 11:36:02 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 04:36:01 -0700
Date: Wed, 31 Mar 2021 14:35:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [PATCH v3 1/1] drm/bridge: lt8912b: Fix issues found during
 static analysis
Message-ID: <20210331113554.GM2088@kadam>
References: <20210331112137.368641-1-adrien.grassein@gmail.com>
 <20210331112137.368641-2-adrien.grassein@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331112137.368641-2-adrien.grassein@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310085
X-Proofpoint-ORIG-GUID: chXT-x6kinUTsf41d25hyoD01PLRAOLY
X-Proofpoint-GUID: chXT-x6kinUTsf41d25hyoD01PLRAOLY
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310085
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

On Wed, Mar 31, 2021 at 01:21:37PM +0200, Adrien Grassein wrote:
> -	lt->data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> +	data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
>  	of_node_put(endpoint);
> +	if (data_lanes < 0) {
> +		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
> +		return lt->data_lanes;

This needs to be "return data_lanes;"

> +	}
> +	lt->data_lanes = data_lanes;

I really believe that v4 will be the perfect version though...  :)

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
