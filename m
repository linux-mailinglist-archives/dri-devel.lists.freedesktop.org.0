Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760843BD82
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 01:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD266E209;
	Tue, 26 Oct 2021 23:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F08F6E209
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:03:06 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20211026230305epoutp042be93c7c8d6c74000f880eb8e1c041b9~xtwgrr8VL2198421984epoutp04-
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20211026230305epoutp042be93c7c8d6c74000f880eb8e1c041b9~xtwgrr8VL2198421984epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635289385;
 bh=JlOYiYhsdzuT20VlO2FDvxFDp+mmb4qL5afTp/ZMdkw=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=CYq1VFGWc8VmEXSjF/SNmcxrg8+qsm/UgrDODsU2ISE2FsEctJs/8iy8hR+zVgWAp
 hbbHnS6XjRFPqvfFCOzNdIhvs4Fdfn30CPGaQb1j28QCXA+AwGmSlJN5xmQWXjEB2x
 eWoDpC4D9JFsCrjY4L4xml5JFw3ivRse5loeumm4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20211026230305epcas1p4f11ca68e994b0240d45b1ef51191580e~xtwgf3gnm2291022910epcas1p49
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:03:05 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.236]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Hf6mj0lN7z4x9QH for
 <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:03:01 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.F4.09574.61988716; Wed, 27 Oct 2021 08:02:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211026230247epcas1p2335f8d9e389ea3e47f15def5c82b18f1~xtwPwgw072301223012epcas1p2P
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:02:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211026230247epsmtrp2079483990720219be4e517e322de4c8b~xtwPwFlhB0111801118epsmtrp2I
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:02:47 +0000 (GMT)
X-AuditID: b6c32a35-195ff70000002566-da-61788916d326
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.06.29871.61988716; Wed, 27 Oct 2021 08:02:46 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211026230246epsmtip1884e3b789c7d2f02a5ea5bb6cc7f0612~xtwPQ56aG3132431324epsmtip1V
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:02:46 +0000 (GMT)
Subject: Re: [PATCH v2 06/13] drm/exynos: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
To: dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <5a106229-b6b9-d006-d24d-4ae774a97009@samsung.com>
Date: Wed, 27 Oct 2021 08:13:35 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ee6b3bac-4762-fd8f-c12a-c0a7ea7b56e9@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGKsWRmVeSWpSXmKPExsWy7bCmnq5YZ0WiwYsOK4srX9+zOTB63O8+
 zhTAGJVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQM0
 VUmhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYFqgV5yYW1yal66Xl1piZWhgYGQK
 VJiQnfH5m1tBG39Fz+4LbA2M13i6GDk5JARMJD5P2cbUxcjFISSwg1Gi+/55NghnBpPE3a4d
 7CBVQgJzmCRatyrBdLydsRyqYy+jxPsLZxkhnKlMEpMXz2YDqRIWyJZovPwJrFtEQFni78RV
 jCA2m4CqxMQV98FqeAXsJH5M/AZUw8HBAhR//0kHJCwqECnx9+QuVogSQYmTM5+wgJRwCthL
 dDbWgoSZBcQlbj2ZzwRhy0s0b53NDHKChMA2dok3zVuZIA51kfgL1gtiC0u8Or6FHcKWkvj8
 bi8bREMzo8TEGaeZIJwORom7j69DdRhL7F86mQlkM7OApsT6XfoQYUWJnb/nMkJs5pN497WH
 FaREQoBXoqNNCKJESeLYxRuMELaExIUlE9kgbA+Jp2t2s0DC6hGjxMO9n5kmMCrMQvLnLCTP
 zULy3CyEKxYwsqxiFEstKM5NTy02LDCER3Zyfu4mRnCC0zLdwTjx7Qe9Q4xMHIyHGCU4mJVE
 eC/PK08U4k1JrKxKLcqPLyrNSS0+xGgKDPiJzFKiyfnAFJtXEm9oYmlgYmZkbGJhaGaoJM77
 Wa4wUUggPbEkNTs1tSC1CKaPiYNTqoHpeFjLZ+HLdm5z1W4aqtZLn666VMwpu37p5560oNm+
 5rvjP/04fpxR78kuB5EVogvuZ5wX1Lyxr6JN67K2/cT4qr7bjx++m/+5yyBP7a122zbl70fU
 kppiuNNXfYg48E/k1fMEzenH1Bvmsno8mffh5fOSRzWaEzNF6pt3mwW7/Is2Pr9NmvHDv5OW
 1UcmMiYtZBcuUDNfECspr1j2U2SxJ7vno4dT7XJ/9QaW7E7f+Mzy7HPJXf+nrS+aHmf5Ueln
 ldivIMny2Wyzn2Rv/fa1o3Vb2s6MBYsUH/vNeRe/wDNmmdvkde2KuzoOLP7k3sBoH3TWKSv1
 08vD7Yzr7TKPzRT6sPjsb8+rggmretojlFiKMxINtZiLihMBchBztfkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsWy7bCSnK5YZ0Wiwc2VWhZXvr5nc2D0uN99
 nCmAMYrLJiU1J7MstUjfLoEr4/M3t4I2/oqe3RfYGhiv8XQxcnJICJhIvJ2xnKmLkYtDSGA3
 o8S8VXMYuxg5gBISElu2ckCYwhKHDxdDlExmkni64wEjSK+wQLZE4+VP7CC2iICyxN+Jqxgh
 ih4xSvxon8AEkmATUJWYuOI+G4jNK2An8WPiN3aQoSxA8fefdEDCogKREk0ntkKVCEqcnPmE
 BaSEU8BeorOxFiTMLKAu8WfeJWYIW1zi1pP5TBC2vETz1tnMExgFZyHpnoWkZRaSlllIWhYw
 sqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAgOWi3NHYzbV33QO8TIxMF4iFGCg1lJ
 hPfyvPJEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGpjK
 a2RMltbO2L289JmnxGzBI14B/5YJXwmc9C8/LLppU+270OPSBluf7G57vn3Cstm6TvLTr0dm
 rpYwuhcXWHHtxuMJ4WvCQm/IiW3b0r/dNYezQach8P7voKs61u97HgnGLSswT11zt03V9mlH
 6NIdiUX2rMu7/z05MI8jNvnAHEnDzXki8SEnfBaUb6xV/tF7iXXXn/sxt9cfrVCPfz83tUIy
 dcqiidfYL+lc/RD67uE7OWtHBrWJrr9suzkMXKbHSVz4sNTpif0/xVSz2YtvXipvdP0ftFV4
 84p/6yYw/tZb+M0ksP+Ealnm5Bkipz9f1jwfcP2oZlOpvvQiqQnfq/oe65zmOta08MAc6/0L
 lViKMxINtZiLihMBafy8RskCAAA=
X-CMS-MailID: 20211026230247epcas1p2335f8d9e389ea3e47f15def5c82b18f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211016193513epcas1p4e354183520df0aa4c381b19eb2863262
References: <20211016184226.3862-1-cssk@net-c.es>
 <CGME20211016193513epcas1p4e354183520df0aa4c381b19eb2863262@epcas1p4.samsung.com>
 <20211016184226.3862-7-cssk@net-c.es>
 <ee6b3bac-4762-fd8f-c12a-c0a7ea7b56e9@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



21. 10. 27. 오전 7:28에 Inki Dae 이(가) 쓴 글:
> Hi,
> 
> 21. 10. 17. 오전 3:42에 Claudio Suarez 이(가) 쓴 글:
>> Once EDID is parsed, the monitor HDMI support information is available
>> through drm_display_info.is_hdmi. Retriving the same information with
>> drm_detect_hdmi_monitor() is less efficient. Change to
>> drm_display_info.is_hdmi
>>
>> Signed-off-by: Claudio Suarez <cssk@net-c.es>
>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> index 7655142a4651..a563d6386abe 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -893,12 +893,14 @@ static int hdmi_get_modes(struct drm_connector *connector)
>>  	if (!edid)
>>  		return -ENODEV;
>>  
>> -	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
>> +	/* This updates connector->display_info */
>> +	drm_connector_update_edid_property(connector, edid);
>> +
>> +	hdata->dvi_mode = !connector->display_info.is_hdmi;
> 
> Thanks for correcting this. Yeah, we should use drm_display_info.is_hdmi parsed from EDID.
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/drm_edid.c?h=v5.14.14#n4725
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>

 My mistake. Please, ignore above Signed-off-by.

Acked-by : Inki Dae <inki.dae@samsung.com> instead.

Thanks,
Inki Dae

> 
> Thanks,
> Inki Dae
> 
>>  	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>>  			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
>>  			  edid->width_cm, edid->height_cm);
>>  
>> -	drm_connector_update_edid_property(connector, edid);
>>  	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
>>  
>>  	ret = drm_add_edid_modes(connector, edid);
>>
> 
