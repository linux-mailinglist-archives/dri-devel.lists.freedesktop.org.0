Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299E437D37
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF93789458;
	Fri, 22 Oct 2021 19:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 22 Oct 2021 09:35:59 UTC
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A73B6E929
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1634895359;
 h=subject:to:cc:references:from:message-id:date:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1dmNTJLtZ88C511eeAfj50yNHRBGH1CGA3LqoJJKFq0=;
 b=CfEcq+aGPBO0lbqRhE+WoJDYq/1Gnx6qBIZ7tGDG2i+d1vM88QIMNDZf
 5WKubPQUsdnkVzPCiiapgFr0WtRvEVldEGWDzdYy7xgCkSsKswuE7Ozt0
 FeNV7KXl8ZZ3vfqFgHclCA9p0URif/ejoZt+aAZvc4aBbtachmgmWSOdU I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: UP/KYTxqp5H8qocDfBKCDFSlp0W5SZOXxKDiUTFhPQMj8tCNMK6IEAlw8r2spKIhOqJZhpmQLM
 E94kaYFz6jm5rWyFzisKLTEeetCgubFO6H7d8zKdnX/OyT+4a5MXMB+agYozvc0L0IOdQCIFtY
 44kH6i9Eq7S6CYnDCV3OxBEVo1yFKtXeTxKJ8HqH0rrrS8G/Pjg/G6SikPIs4i5HzkvwI0EkTL
 xHUT3F5/TQCJS17cQT1SC4YLLQ51ObbPSPPNSaTiFM0mjqSRZiFRChE3smpx3Jg29MbRx8lNC6
 M2k6qOoCFKCcazsqPRtfKHF2
X-SBRS: 5.1
X-MesageID: 55802968
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lByUp6MYiyAPRjvvrR29kcFynXyQoLVcMsEvi/4bfWQNrUorhTAFy
 zAcCD3UOvyPMzbxc4h+bYWwoB9XvJHTn9MyQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Ug5w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxHWtftoi
 /dKjqWhVy0SO63jxeEgfAYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWpg3pofQ6a2i
 8wxVRxSMi3ZQhZ0P2wlIqInuOKijGTgfGgNwL6SjfVuuDWCpOBr65DpMdzIapmLQ91Igm6Gq
 W/cuWf0GBcXMJqY0zXt2natgPLf2CD2QoQfEJWm+fNwxl6e3GoeDFsRT1TTifu2kEmlQPpEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAIVD8EZNE4ucseQT0xy
 kTPkcnkCDBiq76JTmrb8a2bxRu4PjIUNikFfjMeShUe4MjLp5s6hRbCCN1kFcadlcbpEDv9x
 zSLqikWhLgJi8MPkaKh8jjvhzOqu4iMQAQ56xv/QG2o9EV6aZSjaoju7kLUhd5MKYeFVEjHo
 H8enMue6/4mApSElSjLS+IIdIxF/N7cbmea2wQ2WcB8qXL9oBZPYLy8/hlae21CK4UmfgTQc
 VH5ggZRy8JWAVS1OPofj52KN+wmyq3pFNLAX//Sb8ZTbpUZSDJr7B2CdmbLgDizyBlEfbUXf
 M7BK571XCly5bFPlWLuH48gPakXKjfSLI85bavwyAi7yvKgbXqRRKZt3LCmP71hsv3sTOk49
 b9i2yq2J/d3DLKWjsr/q9d7wbU2wZ4TX8yeRyt/LbbrH+aeMDt9Y8I9OJt4E2Cfo4xbl/3T4
 la2UVJCxVz0iBXvcFvRNiA/Mey/Bc0i/BrX2BDA237yhxDPhq70tM8im2YfJ+F7pISPM9YkJ
 xX6RylwKqsWEWmWk9jsRZL8sJZjZHyWafGmZEKYjMwEV8c4HWTho4a8FiO2rXVmJnfn5KMW/
 uz7viuGEMVreuiXJJuPAB5Z5wjq5iZ1dSMbdxagH+S/j221odE0cXSo06drSyzOQD2arganO
 8+tKU5wjcHGopMv8cmPgqaBroyzFPB5EFYcFG7ehYta/wGDloZ66YMfAuuOYx7HU2b4pPera
 elPlqmuO/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LynUx9RLu41M2qRd5Vm8V
 HWQ94QIIr6OIs7kTgIcfVJ3cuSZ2PgIsTDO9vBpcl7i7Sp68ePfA0VfNhWBkgJHK75xPN93y
 OstopdOuQe+lgArIpCNiSUNrzaAKXkJUqMGsJAGAdC01lp3mw8aOZGFU334+pCCbdlII3IGG
 D7MifqQnalYy2rDb2E3SSrH091CiMlcoxtN1lIDeQiEw4KXmv8t0RRN2j0rVQAJnA5f2ud+N
 2U3ZU14IaKCo2VhiMRZBj3+HghAAFuS+1DryktPn2rcFhH6WmvIJWw7GOCM4EFGrD4MImkFp
 OmVmDT/TDLnXMDtxS9jC0dqpsvqQcF16gCfytusGN6IHsVibDfo6kN0ibHkd/cz7RsNuXD6
IronPort-HdrOrdr: A9a23:gQxdCKPOHnqT+MBcT1H155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzQ4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 XxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72weBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlFXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbdrmGuhHjLkV1RUsZmRtixZJGbDfqFCgL3a79FupgE786NCr/Zv2Uvp9/oGOtB5Dq
 r/Q+JVfYp1P7orhJRGdZE8qPuMex7wqC33QRavyHTcZeo60iH22tTKCItc3pDcRHVP9upqpK
 j8
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; d="scan'208";a="55802968"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeDe+UqHNKT2FRkbUA61UPM3qnr1gsMU7dL7zD8nq4A5ciIiDVvaYncQvU2KDFg2/iIM2LFprWPYkLpt1gPMdR9w/6UvHS+09/JX+Fa1Fd5EyVPg5WBZW6nWWCuwYpoiTsVj37oP2h3+qj6/BU44kUJ+67ux4vQuTteRm0YALdn0WV72+7qCT/hAypXuXxFk/pR+NcHmsJvc3eJKeHYTQnMGCs6IpAKym6N7DH5JO1d5ZFR+p8FlUxeaytdrnn8CC5nPL4q8IeDnqW+eS+7giJ0w1uMFAspnFpZxJ06iW3r/Am303p+oxFm9dIvWTbc0tp2/ccVRXXIjnC/lvJNE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dmNTJLtZ88C511eeAfj50yNHRBGH1CGA3LqoJJKFq0=;
 b=YAC7uszzKcPzUCxcAlWmDMh+GXzviz9Nva3YTskQQh83K0Gsh3gVLmt6VtoBTH89O0zp0ZxuM9uavhjPRTiWrMiYyn9Znq9L2Ci8ngUO7ImMKGZ02Q+C23DsGMdFexUmvxCXxS6XTfOjNIPOmldd7bplVIcVTumpnPvWMQlFpx4jo12e4U0WzOqMQkE6ssYqqRXAMr98xLjEaDAHUOJfCUbCEUU/Yl6O9jmPsyARInwOLFsnOZbJznN4wkIXLbcYfUqlbJdykFxUZGotNIPIJlr1STxQAB5zkAgrKMYsuBqCEsltPvhlGbqPd4IoLW7GmfxgMhXJZ2RTu52VaDsJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dmNTJLtZ88C511eeAfj50yNHRBGH1CGA3LqoJJKFq0=;
 b=aYqgrVg1x4VmQiPkmg/VImi8eqbXXL/kY3t4FDk5Md9+FbeWPY19Q+JYPBkidXPlCloxV5/5kzd++A4QYsA5Z18OQgQyAFbLTcqb9lE0WkcyJHcXeex0hbddI7sIoSt9YqCpA/ia4wnwfINQFPh3FbpJWrHV7G3XH9pSG8BopHk=
Subject: Re: [PATCH 1/5] xen: add "not_essential" flag to struct xenbus_driver
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20211022064800.14978-1-jgross@suse.com>
 <20211022064800.14978-2-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fe397fd6-a80e-d3f9-08d2-4f72ec739c0b@citrix.com>
Date: Fri, 22 Oct 2021 10:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211022064800.14978-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0453.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f2d8f74-a5ac-4f29-a0a0-08d9953e59c2
X-MS-TrafficTypeDiagnostic: BYAPR03MB3863:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3863EAA25284A3BF266B3555BA809@BYAPR03MB3863.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1gQX7y+XiDMvDH4+nBlHr9uhucCGDGzH91vhTL6cZbBMllixyYS8EjpOrDdu7sQPSlWl46m+W7xCHGTgkfnq0Vhr5y5t/mT47YChr4YYlPM6TBCM4tV2A6gQoxjkkl0AMGCw/GDeYbFG9979F3VE0Y5sEg5yccsUyi6wij0WP3OUuCnIo20BWOeLLWQ/xG9UhvCUWJzB8FFBf2B1Ftzf011+7kPy9hP2KJL3pv/jmP+WIi34ZthjFgG4yjHUKajYTg8wp6zktiSpMd9qaGmopTKIeWmkTmKaDU8+1iWl+l7dSM6I/u/SBPVgfgCDEJP1LoHIi+q3DAIdewwmyMxMJOuFcNFzn34CPmjZv8FUcAQCOVHJBf7cdXXOPJRKVsMEmgP9nU4gXlqy6oOAYJrLDsYGG3NS2jdnshZNmcbsvQlHcmWuIP9pOSKW4ILCEpJniREx3cbFUxYxRI6NtwAyPKJSHBlC3tPRbKgkxbCZXsOBjBJUWHwSM0yIqp15f1+CujMWzcMOeJ2F4UQ8v8nPyEoOc01wIfp796MyRlf2KSTAyeWwZfj+PXOyZOn4YJMvjzeI2A8H428qWxGNq19crXd0yQaqp6GM4jWruMGn+8H7cyn8OpncBTYFLO8G7ZwMDVu5310p3+1RZKpS9akaDQlsvcBmwD+cyo3AiNYDb/1wTghJ+FtGY/r0jJEXtFIuoMai790qUD82LTTg6yT/kqo7e/wWyTimsNLUtiZXbZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB3623.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(4326008)(186003)(66476007)(4744005)(66556008)(53546011)(316002)(31696002)(82960400001)(83380400001)(6666004)(26005)(54906003)(2616005)(8936002)(956004)(8676002)(38100700002)(66946007)(6486002)(16576012)(508600001)(5660300002)(2906002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU9oRW00TDVaYWJ4am1wSFRKZHNueWhhWHhGejBiMUV6SFZGSWMzNkUzZ3dX?=
 =?utf-8?B?dVZzVnN3NDYxNlEzT2hmZ3pPWVN0OGIxVThxWVVZVkJPWXpGeUhXc3Q2bERy?=
 =?utf-8?B?eTlOaEdYTnNYNktSREhhUFhvNlVoN3JScHR4WDY2cHIyMEFTWGNZYkx3K0xU?=
 =?utf-8?B?ZythbzBhTnp1bTVkM0YxckZNOFEyQ0huQ2Y0c0pOb3BwdFZCN3l2Z0NmM3ZU?=
 =?utf-8?B?bE9idStWc1ZqN0lUbXkwYW9sb2kxNVFWMHJKSEpxYkNYMmx3RFROeW10YmpB?=
 =?utf-8?B?dERyVGUyeDBDMXZNQjNldXBHczVWVFQ3b1F2M2kzRmMvNEU5cVFjNGF0T21q?=
 =?utf-8?B?WjhGblJ1WldVci93WU1tTVBabk9YQ3JtY0Z1OFpVeDBCRGRNSGhNNDJWZEhq?=
 =?utf-8?B?b3U5WnA5VzdtdkZOWDJhNlByekpFRGVGRkcvUm1TQ3dVSGZJelJQckRmdTBV?=
 =?utf-8?B?ckJ6dUc0RFFjMHhCSG1EUWZ3WDRRSUFBaC9UNHNhL2hiWmo3M2U3eFBQWS9W?=
 =?utf-8?B?LzkyRW92WUxIV3NiUEtoejFucmNJazNBVUkxNUd3UmQzbXpDUTNVcEpiQ1ow?=
 =?utf-8?B?NncyN0tHTG9RRkFBTURScm1tZ2c5MVdqaEQvVjAxN0hsV0ZpOUxzY3NLWENR?=
 =?utf-8?B?WGE2d2Q4OWpUUVpuS0hjOVkzTTZmMTNvMlY3Ni9jMWY1TEtjTXVHL0VMUk42?=
 =?utf-8?B?K3VwMFpOUGZWTzJKTjNzRUpLNk9NYmJFZjBtaTBKaVRGNjRCS3daSlgvZTJX?=
 =?utf-8?B?cUdIWVZxanZVdS93NmZiUTluNzBNY1JBdklaQlpyeVIwTHRQZ2VKbVlRUzdX?=
 =?utf-8?B?aWN4YjNjL0NMVUhLckxTWTUwbVYzSXZyaFNNdDZmYVViNVBNSHNqcXpmcEhZ?=
 =?utf-8?B?YWNnSWk3RmFzaGNWWW1yR0plbzVIa1d1THlWdktTNUU4Z3NLUUVSUWExQWZv?=
 =?utf-8?B?U09uZ1EvcTBHUU5rU1pzdklDdVA0aDRJRjJWNzI1aFVaQ3N2MEswaGtsOWRq?=
 =?utf-8?B?d2hTUER6SXI0YTMyMVRTT0RiTTE3NUgzUk02YVNsZE0rNHo1ZmhQWGoyTVhn?=
 =?utf-8?B?am1ZYlJFQTRhSGdwakJLeDNqcDIwQmZieUtoVjA0dUNoSTdmdm96QVlMeUcv?=
 =?utf-8?B?anZIRVVwZGJDMkxOelNhM0NJdlo3MlR1TmlSMVkzWi9TanZMclhaa2lTMFFV?=
 =?utf-8?B?K2Z2RGtZUXlscnY2R3YyRm1zb3RkeUwyREs4OTNleDlyTTFlQVUySFRIc3lI?=
 =?utf-8?B?UFhmM1hvcXRkQ3ZVNXZoTjR1T3lIZnAwcFczRzFJc29NK0VIWmFzMzhqcUxI?=
 =?utf-8?B?UlFvU2xNSXlQNjA0azB4MHA1Y0RqTzNZNXdPdUkvWE50VU50TTdpT0o3a3JE?=
 =?utf-8?B?Nk1aL2ZMTDVlODRlVldVSlQvbENxWFEvaFlRUlB0Q0NLbXBPYWlNcWFxalpT?=
 =?utf-8?B?aDV6U0hpWjEyQVBFVk55MzRoN0w0cGxSbE1hVTFxWGx0MGxxQWpWcldIRjVJ?=
 =?utf-8?B?bzZvZXR4dWRjL2hick9talVHT1hXVWM0cTd3Z3AzbkZsa1dWM2NyZmYvRFla?=
 =?utf-8?B?cU1nMDBzK1V5Q2ZMNWRmS1h1N2ozcGoyampYRm9lQ0dWSVpEdVRqTldIVnd6?=
 =?utf-8?B?QVZwaGpqMm1UbEJSbUxVTkg1ak12WFpIZlBONVAycFVFOUhIWXluVnFPeVc1?=
 =?utf-8?B?VnlDU1ArUUFHTGRJNmtrOEZGS2xhTUVoUnNGd0tEemRPMU9Dem5GL3cvUDNj?=
 =?utf-8?B?czB3Zjl3em1RdHh5WUFWcTNTWSthUCtWNFVVQ3ZueHJaSENFRWJKSDhTOStU?=
 =?utf-8?B?WjU1bEpBbEU1ZXQrTmZYcmtDWm1NQlQ1OXQ0Ti9raXZGVjhRSGlCOHh6L3hS?=
 =?utf-8?B?VDltMytIM1dIOCthS0h3ZFZKU01ydDlLR3JWemVIL2dMWUs2YkpmNHJMaE5B?=
 =?utf-8?Q?iNBRo1KviLHlZd80ac5+6dKSOoMjuih5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2d8f74-a5ac-4f29-a0a0-08d9953e59c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 09:28:48.2350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: andrew.cooper3@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3863
X-OriginatorOrg: citrix.com
X-Mailman-Approved-At: Fri, 22 Oct 2021 19:02:19 +0000
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

On 22/10/2021 07:47, Juergen Gross wrote:
> When booting the xenbus driver will wait for PV devices to have
> connected to their backends before continuing. The timeout is different
> between essential and non-essential devices.
>
> Non-essential devices are identified by their nodenames directly in the
> xenbus driver, which requires to update this list in case a new device
> type being non-essential is added (this was missed for several types
> in the past).
>
> In order to avoid this problem, add a "not_essential" flag to struct
> xenbus_driver which can be set to "true" by the respective frontend.
>
> Set this flag for the frontends currently regarded to be not essential
> (vkbs and vfb) and use it for testing in the xenbus driver.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Wouldn't it be better to annotate essential?  That way, when new misc
drivers come along, they don't by default block boot.

~Andrew
