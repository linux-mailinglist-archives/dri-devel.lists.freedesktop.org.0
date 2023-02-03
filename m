Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1F968B848
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C871F892FD;
	Mon,  6 Feb 2023 09:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AA210E08F;
 Fri,  3 Feb 2023 21:55:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313KTSjW025071; Fri, 3 Feb 2023 21:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=zXDLHevRmbNSieNjjZ1itBUbVMHRS4dQ8ncRciz05CU=;
 b=FnAt2NZyHNV925FRMJKX5HNFpbtGl80xJ5Simzd4dnspOfwMwmJY3Kq/mxJkJYucCcM5
 ZrhNIHiMbmasCmA+UdX35t4SvXC3y//w9S0LXF8zViotoGYqj3OS4TMFPlxLKVWRm2Sb
 S74EUPFZJEbnmYukTsRs75yWT0n1UEAzFeqdEtOGZ0CAjUAusSbb7RlU/C5+zYoWzf+3
 UZBV7FdzQl84NnWUgpDVWIhzXwFgYB3XpHwpHwkrNj+5OcIFqU34wjW5EeP/Ev207PNW
 vV42m8XCBn1squCKUoXdorylZE2Y3lNSWd2RsmFrF00WR+bdSkVYJNCrKSo/35wP8dFA QA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngw4p9thc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 21:55:35 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313LtYE4001279
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Feb 2023 21:55:34 GMT
Received: from quicinc.com (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 13:55:33 -0800
Date: Fri, 3 Feb 2023 13:55:32 -0800
From: Guru Das Srinagesh <quic_gurus@quicinc.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Subject: Re: [PATCH] firmware: qcom_scm: Move qcom_scm.h to
 include/linux/firmware/qcom/
Message-ID: <20230203215532.GA10258@quicinc.com>
References: <20230203210956.3580811-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230203210956.3580811-1-quic_eberman@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IakSQGYsVJaEfb-gAExeEyYclWwLMuK5
X-Proofpoint-ORIG-GUID: IakSQGYsVJaEfb-gAExeEyYclWwLMuK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030197
X-Mailman-Approved-At: Mon, 06 Feb 2023 09:10:58 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-wireless@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, linux-remoteproc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Vikash
 Garodia <quic_vgarodia@quicinc.com>, Eric Dumazet <edumazet@google.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Will Deacon <will@kernel.org>, linux-scsi@vger.kernel.org,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>,
 ath10k@lists.infradead.org, iommu@lists.linux.dev,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-media@vger.kernel.org,
 freedreno@lists.freedesktop.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-gpio@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, netdev@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Feb 03 2023 13:09, Elliot Berman wrote:
> Move include/linux/qcom_scm.h to include/linux/firmware/qcom/qcom_scm.h.
> This removes 1 of a few remaining Qualcomm-specific headers into a more
> approciate subdirectory under include/.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Reviewed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
