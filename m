Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65607B21DBC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 07:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9E710E328;
	Tue, 12 Aug 2025 05:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U04R24ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABC910E328
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:59:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Z04L021591
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eOXE9MNO11AvtJ2FCkQ+sRifjq8EJjmsltwKqyVWBgU=; b=U04R24ph26eR964c
 RMgEF7qoJsTaXhMNacIpqZP9Tw2valxJYBdGsLjaKLRH897v0rU2TFkXkj+fZGAl
 RMKN4DXcCjsObsNUc8PcSd0gUfAW1Gm9/Www96nl34S1FbpWhh3Anc/7ZysK3yJo
 NZz0R3XcwXWedq9CZa8cDsaqBKTPzvzJGczykBIWCy6OWiyCn+PHpzo9AGmq+VZp
 vflXx869uti571WUarpN9HAKhIW3isuoLfY2BSkYspyBEsdLZnmLhcaSPYuAEqdp
 jnZOxyZRtz19BhLAcnaIMODynbZVTgh0waQ9B+RGmLV4C3iF2MUcWQzw0X61zkci
 ZoudmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj4700h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:59:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-243049e6e1dso1159565ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754978346; x=1755583146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eOXE9MNO11AvtJ2FCkQ+sRifjq8EJjmsltwKqyVWBgU=;
 b=QxIgDMkyPgZDEPrzQi9uPoCOGSb2XKBQ9SMEXv3jIYP0Ba882DZaMyx0uhpI8Xl0dn
 /j1U+ZMSoy0toTLYjGUnIS24tNEOM1b/T1Rz4i5jNO+V6cHY3UvGz3dRf0wfnp9H2/m0
 6MEXEfj3AeieKlgSXsfdGTbVb1uR13tDY0AjVepLu4QM+CpeKlOb15YU698nH0CVOF2k
 y4uKG/EtNWDL6yz2qxmLpXPX8OlNXVOP7hQ9iKqQS/RjOjeHiThr+yajHjivmzXpY+qv
 3Sg0eFdUhODgFkt/kE8ojMlplZxWi82yhyDZjhKI0Wu8QcZKKeI9yWF+hYC+7rbgYg5W
 JgNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2241rXlLyWiLzC4ugH2hJKiRdUSjU8B9DKxCIJdbQ6ijRgkBvbWZ+BfuQfsXUw7iqATYrUNZhrdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3vRoRLP8bm9Eeo0pPUdWLeVlw/JlD/fIFs39tD5UL9sMs/SkY
 wzmTSzaHSDjd6GTZ2D1oSnkrefCfuktEJX3ws2g2oh/mrO4pn9h1g4QJFUDBqJcGfS8cc8Eq/+0
 rH0kWBM/GC6NnwjrYHzsK5guiS3Y9TrNl9aJqzuu690Up5he/4uSIDhC0J4YQbdeMwGhVAv0=
X-Gm-Gg: ASbGncsqIFMRsleL32/BKCExyKIv9F7l1P9hVu1r7n+Bc7Zsaz2wymkJHUtDUz8I671
 wExitcJMMMDMsuae4avXusvp6sGAe/zYomKisEqMiO4uYPDHVkgO7DaRmlTPDJxONQWnwTjDyd5
 +X9p+vE7pi1GDYxOZOnosVIwm54PenB1SfR6Nd21FB0NyRKpMszBEH1JiQuHXaWEwtQK/eaAViu
 rFdqUth6EP0IknCz4HtVlU1kdXiUVNF4rwl9hrXLvxATGiWDwMnVbzDcY3oIIicop337j4Xf9N+
 GT+r108mC4RsTb0LeTzQODKjDbUlfmKzKwjPOBdBX2o7jdmCNQf+gKK6gJnuZ6I8KbxhGJU=
X-Received: by 2002:a17:902:dacd:b0:240:5549:7094 with SMTP id
 d9443c01a7336-242c200e82emr224518165ad.18.1754978346002; 
 Mon, 11 Aug 2025 22:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX0c7+1zMTIBtfK/B52VR4L4RdKkG5Jv47XKjyW5YwjgzPLE/21ZmRClHXGIpYpgq6/G5jkA==
X-Received: by 2002:a17:902:dacd:b0:240:5549:7094 with SMTP id
 d9443c01a7336-242c200e82emr224517935ad.18.1754978345535; 
 Mon, 11 Aug 2025 22:59:05 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-242fea29f1fsm8786145ad.99.2025.08.11.22.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 22:59:05 -0700 (PDT)
Message-ID: <4b190271-095e-4c6d-b823-e4d3c9e15fed@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:28:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] misc: fastrpc: Cleanup the domain names
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-5-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-5-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXywUmHK77lSv8
 z2fl69dyU5Kevgv0Dt7a1K7pHAuMSl4u6E1o32oiL5juklGx3Go4JI1C12xrnltDa6lkWMs/yj9
 gA4XlemtfSqY0C0aksqN77QPmksuswA3j5yeHOYNRNv3Fq1gFkf2QnTsim2J4lpOiDtdIKiC+vU
 nxQ1MNHSnjufwyZDCfs0hxpzzwF5WjtD/2f6SFYtkLKF/kou6sahJ4SjoUE14YV6gCEtu0N+MSt
 TGsL9t91pTKBjN4gUMFp1GsggdDnyGs3QU9kbrcKUfezHLdTWFZKYtkq5nS8Bq7RpEv1EkBcpmL
 YbdL85m1/xE4SJ4gSTW/xv9heu9mt4+W3Dt5t22lDhVnKoIEAYPaPui0TxcZn6oPouXvHn8cVlG
 dKVe45/n
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689ad82b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=XdWXSf2iVvfrRCFRniIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -XIsu12y8mHTfwvxpNvE9TBvTNpQ99-L
X-Proofpoint-GUID: -XIsu12y8mHTfwvxpNvE9TBvTNpQ99-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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



On 7/16/2025 6:58 PM, Ling Xu wrote:
> Currently the domain ids are added for each instance of domains, this is
> totally not scalable approach. Clean this mess and create domain ids for
> only domains not its instances.
>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 495ac47e7f90..85b6eb16b616 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -27,8 +27,6 @@
>  #define MDSP_DOMAIN_ID (1)
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
> -#define CDSP1_DOMAIN_ID (4)
> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -106,8 +104,6 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> -						"sdsp", "cdsp", "cdsp1" };
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -2243,6 +2239,20 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>  	return err;
>  }
>  
> +static int fastrpc_get_domain_id(const char *domain)
> +{
> +	if (!strncmp(domain, "adsp", 4))
> +		return ADSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "cdsp", 4))
> +		return CDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "mdsp", 4))
> +		return MDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "sdsp", 4))
> +		return SDSP_DOMAIN_ID;
> +
> +	return -EINVAL;
> +}
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2260,15 +2270,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return err;
>  	}
>  
> -	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
> -		if (!strcmp(domains[i], domain)) {
> -			domain_id = i;
> -			break;
> -		}
> -	}
> +	domain_id = fastrpc_get_domain_id(domain);
>  
>  	if (domain_id < 0) {
> -		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
> +		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>  		return -EINVAL;
>  	}
>  
> @@ -2318,21 +2323,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
> +		/* Unsigned PD offloading is only supported on CDSP */
>  		data->unsigned_support = false;
> -		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
>  			goto err_free_data;
>  		break;
>  	case CDSP_DOMAIN_ID:
> -	case CDSP1_DOMAIN_ID:
>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
> -		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, true, domain);
>  		if (err)
>  			goto err_free_data;
>  
> -		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, false, domain);
>  		if (err)
>  			goto err_deregister_fdev;
>  		break;

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


