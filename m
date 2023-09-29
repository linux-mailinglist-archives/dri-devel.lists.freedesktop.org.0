Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D27B2CB8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 09:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B9410E6B9;
	Fri, 29 Sep 2023 07:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B778C10E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 05:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1695965986; x=1696570786; i=wahrenst@gmx.net;
 bh=419i6xJIeP7rl0R9x2nNayuMoFrALLyAr9RQWvc/CpE=;
 h=X-UI-Sender-Class:Date:In-Reply-To:To:Cc:From:Subject;
 b=r6IMvNp6iJpt/vn5MBWL3rGISC9DmYE2JlwCezJbzWgJAH2i+hpG0y9736sLAJ6neQImw6/j1PN
 BryJ8s7hPF/90h9gGub26QO+TbhMSztZ7vc4pPt2UPmjeS13FAH2sxz3jTKXbwo1g948dSpRNwAFL
 byQSMTZuw81AF6o2/iOAU8ks4WafMLuGJkFAIEZEcohR+UOTrcRnPERd5fuQqjPrESFx13/d6ondB
 N/VOxLfU9lpO39sATLlprD/Oi6RsYhOJwUWRyl+Q3Sj7/Gz6cMgR2gu7GlyvrOFVi5BNKwSc7G+wE
 S4qKErE/unV3T3FVY+O9yy7LLLm3C2Tk4AWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wyy-1qgcUU2OeK-005YGR; Fri, 29
 Sep 2023 07:34:22 +0200
Message-ID: <083b109c-4418-d613-1135-329a43dfac4b@gmx.net>
Date: Fri, 29 Sep 2023 07:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
In-Reply-To: <20230928114532.167854-4-itoral@igalia.com>
To: Iago Toral Quiroga <itoral@igalia.com>
From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 3/3] drm/v3d: add brcm, 2712-v3d as a compatible V3D device
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IhuYkVvwI13o0P3a9SfKxUmevUupKFz7JgtLLVDgn/oPv0hsyz+
 ILveWF4MtTM9IZ3oFUslgnumzySVuNGpQAwUaodmiL/B+j4M04jGvt4b6AXiYL2igavd18Z
 G1FhLNoYJPpK9eIVR8I73s8AQvWwWU2wnP4IHHV6x/5LQR+88j2F0FXoPQJPAYOuhuHnuOy
 zJ5jfAIiwWKA+CB5U6lAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:01StSES/i8U=;gS4sRxx/TPUG2R5yltdhekeQrYI
 2BfAbbZVOyJ0ebzqdqaQJJc/tFNVW9QLsOCLW4C5hAl9G04VNEJJFHJixq33rdPYGoecJHCr5
 5Ca7gh0vroGURQGVZ7r1FM8wYZkNXBjj0ywvkernbY5BuxB/C6bflgufEEl6dXMCMS0KoYuB4
 a49r+lMBqMyzw5jt485Jxy6rqIu6S/ectuf8WI9qQVrLf5Il18fiOkfHTTH+G6tIqQ/t1ilfL
 5lrXVLTrcyoIlRLf6sW0ST5i+JGIqjEzM/Vt7rXI1S48p5hdszAR+Ym5TyvXO/r3lLLBQMkj+
 /mh1ZxbR+97rSE+eNzk2bMsPKAn7yh0i5nXbTBJBR7u4wLc/jytZTJS/Evjh9xy+DSBXnRSP0
 grVK2qdnH44bw6kD1syN76VuHidtxzgsc28tVihh7bvxDoGQnNBTceeL9pzMNVbftTSLIbEoJ
 HA5zInZCvQRbZhuL29pz4MDJbZ6oY33ufGXnmgZdKblAa+q2fTlbWn+ZuqEj0Gy+f/HZbsUeM
 DCGu73sfdUHpffV99JVDXLgv/gbd/8+NCcSnMwqmiHQH6MBWdlgyB5AzKuEcyOTGIhoAbxP+X
 tYKuKCLPuA1W7EGNMViARbvAhGr/4u4spTFbHwgJdbo1yWoLWmZPhZA5ExJlNXza5ZCMHfCyN
 qKMXKJ2Z79Deu09hCxIgIN2BgTSPNSTa5h/Xu7NPkWz39HyLEATCqFW3XF6w0NgBS0Do7vZ8H
 hJW4kuLzN+Cde6E5UzbcScUH9fjO33Kpe34Dlaapo5zKiR8FoquVh5F7/CHsPVZ9bwHp2IFs9
 a8DqUSxL7jvQwMAmtlHu+bU6gpQQ1fMvmlEjtROW7ZM5KMmWQUDUGWpjVbVxrFwECxCeJ74o+
 H+MAnBJyEQWEP23NJtjwAHCh08qzZTg93qbJFoTZsEE2SNaRitkvISxVGmmaRP6LuSVh1pQTk
 teRLKg==
X-Mailman-Approved-At: Fri, 29 Sep 2023 07:00:19 +0000
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
Cc: Maira Canal <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

additional to Maria's comments:

Please keep the order of the compatible strings.

Also you need to update the device tree binding before this patch:
Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml

Also make sure that the series is send to the maintainers, not just
dri-devel by using scripts/get_maintainer.pl

Best regards
