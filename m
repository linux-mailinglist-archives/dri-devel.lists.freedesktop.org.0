Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39736EC8D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 16:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B706E24E;
	Thu, 29 Apr 2021 14:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1386E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 14:43:08 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TEcpRC170468;
 Thu, 29 Apr 2021 14:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=0TxSLY2kK7MRYTK3OCHRP+D+iyiLTYfTm+JrDkZiRAo=;
 b=RaDqu3/sPl10o4gzt+6L/q9Zc3rm2lM/kSHtQzetaHGVDP9XlObX15NNDL1gWs7iAM9Y
 NI1p7sc0FiRIk5tRsn+/CnQZFt7kBWbyVGJqUmpnpjLP8SHCFFV7Rv1kZKzOqpnhjkH9
 VcvmnjgWsg05xuMO3iUQq4ZQ8wE/mPM4CA5004rdtQTYD/veC3kgeXhFsLSMNDrM4Ogp
 LIs/em2WTvR6oY65gRbOVc/cn+CaVpZozNcl1EsOkWPH3KNEAFarVcKSaiZZ8X7DonCl
 Qcl5urAs5T9c3bu8fiZ5f/pstjAbAQxO1xAMI19lzDwh2wu1Nxv/8459oeQUx/KVX0gQ Zg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 385afq4pmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 14:42:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TEYvFc142941;
 Thu, 29 Apr 2021 14:42:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3848f16duu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 14:42:55 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13TEeBXe167217;
 Thu, 29 Apr 2021 14:42:54 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 3848f16du8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 14:42:54 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13TEgp3s016029;
 Thu, 29 Apr 2021 14:42:52 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Apr 2021 07:42:50 -0700
Date: Thu, 29 Apr 2021 17:42:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/4] staging: fbtft: Don't spam logs when probe is
 deferred
Message-ID: <20210429144244.GE1981@kadam>
References: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
 <20210428130415.55406-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428130415.55406-4-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: vRDhrSXBtS_W24wT_EvXu4bM1w9PI0VE
X-Proofpoint-GUID: vRDhrSXBtS_W24wT_EvXu4bM1w9PI0VE
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9969
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290095
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 04:04:14PM +0300, Andy Shevchenko wrote:
> @@ -75,20 +75,16 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
>  				  struct gpio_desc **gpiop)
>  {
>  	struct device *dev = par->info->device;
> -	int ret = 0;
>  
>  	*gpiop = devm_gpiod_get_index_optional(dev, name, index,
>  					       GPIOD_OUT_LOW);
> -	if (IS_ERR(*gpiop)) {
> -		ret = PTR_ERR(*gpiop);
> -		dev_err(dev,
> -			"Failed to request %s GPIO: %d\n", name, ret);
> -		return ret;
> -	}
> +	if (IS_ERR(*gpiop))
> +		dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);

This should be a return statement:

		return dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);

> +
>  	fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
>  		      __func__, name);
>  
> -	return ret;
> +	return 0;
>  }

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
