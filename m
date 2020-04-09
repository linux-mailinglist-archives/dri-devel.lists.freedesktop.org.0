Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CDC1A326D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 12:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C556E0E7;
	Thu,  9 Apr 2020 10:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A126E0E7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 10:22:19 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 039AD3F2162825;
 Thu, 9 Apr 2020 10:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=d0vbh1SNAcfSwbd6w+AzaTccs3Ec+MTzHAp5ctJy/mI=;
 b=i22hPosZiC/dM+p3jpWetJjF42Y2kWHZbHkD+VgbrR48kvvVmP+4UMTpUhHObeenMkhb
 7kieRdzf8MJgNG252Vn2lddlxAS1iymIblQU3kAElcjKOYqKTzjFCRN81IgBlw1wPsos
 UP9dKE9ZCi7Q9HmsTjc6C2UoJbJRXP0C6ujRtdy2nVl7Q0c/Kad2RQl7G+AnNHHGnl75
 JtV4toMaM2PbmJrXooZFto+IcC126Dx1/2sFtvLsjrA1Hqg6t1Al4ts1fqbxdRloe1GQ
 2H9tdylmPE/VYHtHEE3QcxJUoI56rt6zC4BKVU9LONMpnk0nu4WuKmRseQiThfRXKV/M Rg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 309gw4cj49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Apr 2020 10:22:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 039ALakk093384;
 Thu, 9 Apr 2020 10:22:12 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 3091m7g8m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Apr 2020 10:22:12 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 039AMBAk020185;
 Thu, 9 Apr 2020 10:22:11 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 Apr 2020 03:22:10 -0700
Date: Thu, 9 Apr 2020 13:22:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: [PATCH v1] staging: fbtft: fb_st7789v: Initialize the Display
Message-ID: <20200409102013.GP2001@kadam>
References: <1586424337-26602-1-git-send-email-oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586424337-26602-1-git-send-email-oliver.graute@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9585
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004090078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9585
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090077
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 gregkh@linuxfoundation.org, Oliver Graute <oliver.graute@kococonnector.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 11:25:32AM +0200, Oliver Graute wrote:
> From: Oliver Graute <oliver.graute@kococonnector.com>
> 
> Set Gamma Values and Register Values for the HSD20_IPS
> 
> Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> ---
>  drivers/staging/fbtft/fb_st7789v.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> index 84c5af2dc9a0..b0aa96b703a8 100644
> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c
> @@ -17,8 +17,8 @@
>  #define DRVNAME "fb_st7789v"
>  
>  #define DEFAULT_GAMMA \
> -	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25\n" \
> -	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25"
> +	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
> +	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"

How do you know this won't break someone else's setup?

>  
>  /**
>   * enum st7789v_command - ST7789V display controller commands
> @@ -83,13 +83,13 @@ static int init_display(struct fbtft_par *par)
>  	/* set pixel format to RGB-565 */
>  	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_16BIT);
>  
> -	write_reg(par, PORCTRL, 0x08, 0x08, 0x00, 0x22, 0x22);
> +	write_reg(par, PORCTRL, 0x05, 0x05, 0x00, 0x33, 0x33);

Without knowing anything at all about this driver, it feels like this
should be:

	if (new_hardware)
		write_reg(par, PORCTRL, 0x05, 0x05, 0x00, 0x33, 0x33);
	else
		write_reg(par, PORCTRL, 0x08, 0x08, 0x00, 0x22, 0x22);

Same comment for the rest of the patch.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
