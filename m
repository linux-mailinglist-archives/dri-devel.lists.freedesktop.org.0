Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F1A34FB4D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 10:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F846EA0D;
	Wed, 31 Mar 2021 08:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4626EA0D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 08:12:55 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12V8AOhc157934;
 Wed, 31 Mar 2021 08:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=a4QWKhEMdGCl7BtxZ+vE+rbevPhkc+FBT/vVLwqEJds=;
 b=iS+1W9ifUrYWDytTMaXHvNo+U9Y0SNDvhpAj3j4XHvH/tsFkt7VmKNoUFCNvEp9bSJB+
 lVIRHb4+ZtWZ7YJz9suVH6CtWeetshSU98JLJ2h28Ur4dos0g2Ok2EE3VPZ70mxUvzLW
 pN2H4l7bZSf0Rnz8VW22+2hed9qzsJKMX7kytPi/fsezKL/QDvWpzhCS/JCPIHG9jOcQ
 c3w4UtlTyfNZTaKM02NpGwJoaSMasXE8dk4uauaoITAN60z8WI20f1FT5tKec8VQTj7K
 0vB9dw088kXO5R0vcJ7VqSL1VjQxbckMcwswG0cMPImfh7VIz2fluslWfrPwF2Z/JgL6 VA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 37mab3hbrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 08:12:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12V8AqC7083843;
 Wed, 31 Mar 2021 08:12:49 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 37mac8c20p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 08:12:49 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12V8CmQC011890;
 Wed, 31 Mar 2021 08:12:49 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 01:12:47 -0700
Date: Wed, 31 Mar 2021 11:12:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: adrien.grassein@gmail.com
Subject: [bug report] drm/bridge: Introduce LT8912B DSI to HDMI bridge
Message-ID: <YGQu9uZ/d5ph+eS9@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310058
X-Proofpoint-ORIG-GUID: KxhVqMQ1PX-lVkp7qhm1h78M4bw3_7_T
X-Proofpoint-GUID: KxhVqMQ1PX-lVkp7qhm1h78M4bw3_7_T
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310058
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

Hello Adrien Grassein,

The patch 30e2ae943c26: "drm/bridge: Introduce LT8912B DSI to HDMI
bridge" from Mar 26, 2021, leads to the following static checker
warning:

	drivers/gpu/drm/bridge/lontium-lt8912b.c:638 lt8912_parse_dt()
	warn: 'endpoint' isn't an ERR_PTR

drivers/gpu/drm/bridge/lontium-lt8912b.c
   620  static int lt8912_parse_dt(struct lt8912 *lt)
   621  {
   622          struct gpio_desc *gp_reset;
   623          struct device *dev = lt->dev;
   624          int ret = 0;
   625          struct device_node *port_node;
   626          struct device_node *endpoint;
   627  
   628          gp_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
   629          if (IS_ERR(gp_reset)) {
   630                  ret = PTR_ERR(gp_reset);
   631                  if (ret != -EPROBE_DEFER)
   632                          dev_err(dev, "Failed to get reset gpio: %d\n", ret);
   633                  return ret;
   634          }
   635          lt->gp_reset = gp_reset;
   636  
   637          endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
   638          if (IS_ERR(endpoint)) {

Endpoint isn't an error pointer.  You could just delete this check if
you wanted and check of_property_count_u32_elems() for errors.

   639                  ret = PTR_ERR(endpoint);
   640                  goto end;

goto end is a do nothing goto.  Genereally direct returns are more
readable have fewer bugs (based on ten years of reviewing static
analysis warnings).

   641          }
   642  
   643          lt->data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");

Either way, it's probably a good idea to check if
of_property_count_u32_elems() fails.

   644          of_node_put(endpoint);
   645  
   646          lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
   647          if (!lt->host_node) {
   648                  dev_err(lt->dev, "%s: Failed to get remote port\n", __func__);
   649                  ret = -ENODEV;
   650                  goto end;
   651          }
   652  
   653          port_node = of_graph_get_remote_node(dev->of_node, 1, -1);
   654          if (!port_node) {
   655                  dev_err(lt->dev, "%s: Failed to get connector port\n", __func__);
   656                  ret = -ENODEV;
   657                  goto err_free_host_node;
   658          }
   659  
   660          lt->hdmi_port = of_drm_find_bridge(port_node);
   661          if (IS_ERR(lt->hdmi_port)) {
   662                  dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
   663                  ret = PTR_ERR(lt->hdmi_port);
   664                  of_node_put(lt->host_node);
   665                  goto end;

This should call of_node_put(port_node); then goto err_free_host_node;

   666          }
   667  
   668          if (!of_device_is_compatible(port_node, "hdmi-connector")) {
   669                  dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
   670                  ret = -EINVAL;

This should call of_node_put(port_node); then goto err_free_host_node;
as well.

   671          }
   672  
   673          of_node_put(port_node);
   674  
   675  end:
   676          return ret;
   677  
   678  err_free_host_node:
   679          of_node_put(lt->host_node);
   680          return ret;
   681  }

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
