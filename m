Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBBF350001
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA786EA73;
	Wed, 31 Mar 2021 12:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D35F6EA73
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 12:15:11 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VCEanA078700;
 Wed, 31 Mar 2021 12:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=g/QnWL633DATk/D0Ttai9VtCMe1kqYKn1pLuJll4508=;
 b=AlbNeSS7Su2xmSANGDKk3ucnu6i/vSz3PcaKLeClZK6TsuaBfyEq2wuEKzgobYFzlDqZ
 F3DNtouhtK0c85SHipT9eSTMKHq+f8Wtq6hbir1z59Sm7U+q0QNt2dpTVXUF9K0u36v4
 UyBFO3gASR5b6+pMmkc4/9ekdn9yJmNM1Liw+cRsT1u0FubOMkGbTKJv8a0qQGG9rf6A
 EDjpjB0rrwFnjq0Ra5LsGl7/bNkb2/hyzIeO2jLU29N7wbqEFPE61+3GF2P38oTAhbVd
 Isg/+k4ich5HW6jGGxwcv+CjJvrts4swDkGiVVtCTuDC7gWvry7PNUnEpTfugyHKOQ1g iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37mp06rfmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 12:15:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VC5WBW152754;
 Wed, 31 Mar 2021 12:15:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 37mabm4sqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 12:15:07 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12VCF5ab007408;
 Wed, 31 Mar 2021 12:15:05 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 05:15:04 -0700
Date: Wed, 31 Mar 2021 15:14:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [PATCH v4 1/1] drm/bridge: lt8912b: Fix issues found during
 static analysis
Message-ID: <20210331121458.GN2088@kadam>
References: <20210331114919.370053-1-adrien.grassein@gmail.com>
 <20210331114919.370053-2-adrien.grassein@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331114919.370053-2-adrien.grassein@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310090
X-Proofpoint-ORIG-GUID: EKBksh_fQ6VkNuih62F3wicQMA5vSZoJ
X-Proofpoint-GUID: EKBksh_fQ6VkNuih62F3wicQMA5vSZoJ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310091
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

Thanks!

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
