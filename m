Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EvSANWDqmmaSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:35:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E61921C7F8
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99C310E390;
	Fri,  6 Mar 2026 07:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="N98FkZLM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011052.outbound.protection.outlook.com
 [40.107.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4304310E390
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 07:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4/XsCg4GGRC5CDCubG6QuxvYSxdwdFZZ9Xpf/K5lRJU3YsmGV0kKaymElVHqB8lFPx+9tfWsaO/B8Tm0td/hAHR27Nl958pbb3GLML1/XMYvoxY0rGMWZCvn7L6DEnVdchrizD605uDypc8zSgKbmsQ2M08O7uJnTKv39LTrlT6LHrkCohLK+dA4hBvPtQShgQCtnfieJpxTC146qwedmAavIvi9YLqVxoV1tqCLUfDzE0o/n1JcdR+HJd5p6MYHpC37XqjAuNgcjJeHZBvL0oSHRqp8YnPZwayA0bTALfNbYFLsUJdSmTMSvtGtcuOGKWpKw5grPzXexk66tkKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZwh8TTfpCcU5/zcjmjFXk3RlbARk+tVT/9pRbd2O20=;
 b=c4hooGvbdd9HD9RwGDwSkgCg8WkuNkpmII6VqUW4mEjQhmZVoec752ltCjUO2vXCnQXXf6BqYC5NIkJfcvmr6n0FF05eGv43EBT1uC092RTx5tbOvUTmya5pMROPlczdEtZ5pELoU0WVgJjQa7eFZU5VCYT8lkaE6dkB3trjqCAhVyIwrLj0ttwT1aYw3Mzc9wxHgw+knyZg/taYhXTEK16yy/JjyXtU0O3EqxSqn5hugs/RNnuCO5XySV6fcL5HiwC3sIiw9khAnz6PVLrsFibf6hB3K25e6XMhrcLBp8IUxA5BdZkfMS4pNawo3cNpsk9Ui5KoR+5cjLacPctJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZwh8TTfpCcU5/zcjmjFXk3RlbARk+tVT/9pRbd2O20=;
 b=N98FkZLMTz1FaNDcjLxPLuabejDPw4fqF2Q+THiETwIVIMbD6ziZSusMFkz8UNRhqZja+2flHC3Y0MyLSRILaQpHekIvJEjowqj03JH7SIqB128vscavFAsReJplS+TktWCcMUcMhYkIqAAejoLzmhaB+eTXM5pyjxdgTXIz1tCOhyaqQ8uuf+2Bw8VOoQu79UNPBsp70bLDR6RsfTuUPjTMZWEJ37NI5Hq8Jm+IFFNezj+NHqwCfKoo2Hms5ZDOIUmmSRZIRN803wDIrOOHhlJjwj3ci4s+0S5VfPeKnKbhbIpUo/qoAKNI4jJQJsWcaAFBh02IwfSzQByQrgglBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11069.eurprd04.prod.outlook.com (2603:10a6:800:266::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 07:35:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:35:39 +0000
Message-ID: <5edd40f3-f83e-4a1b-99d4-1e595fc0e4cb@nxp.com>
Date: Fri, 6 Mar 2026 15:36:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, imx@lists.linux.dev,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Francesco Valla <francesco@valla.it>, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-2-bec5c047edd4@oss.nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260304-dcif-upstreaming-v8-2-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11069:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d98ae1-9e12-4245-8f91-08de7b52f676
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: VsVZo+Ljw2Vw0e/2nNr4rUidTvCbNcrvy25rB7pG2qeFfvvMORNySRZvcqhBBzNsSaWnjzFfIWVSi5KkPImeedBGdwVgTiIuMwWT/pCDIqfJw2QNQ23xNstA2EJfxpa63WXX+ZaOU0td0USeJjtmqxRXGHdyWfXh4RfpsIwSe2qNxhpegnbSeQUTimyzbM4cNwo0ckFqbW2QNv5Y8LffJFhRlcSIw4aabQAQnx77fWN71bSnDDXyp9dLInL0VhxEpHWoz71AiA60yiZFg9yahNTetI6AKR99sjvtIZ2z1+CwdS0bagCPT9pj41zfmfmWFlwXVX9IVj1++jhgyY4cFd4Aktqaq9UNWMcUsPzMBfO7XcV9advRQmDr6KtflZzvR0NPSQDf5D/6WUBm1e59Ow+T4ez7Yaq89RBaRkYJMgvkxuFqJFhATVTmvmK1G2C6aamX2GNqlr4G9hRhOdbku1bFaqAk3LKr8tIo+fKY0i490ORV0hLf8IZen03t3Kx54ALGcM02lY2ebKGYYN5B7eGH1f3H/InoMVgiTu1aj9W2jo8uNqrFFvA1wJHY/aqYNSpZJRn6PxLGL1IbpgXWFYSA4Jc+bx6RsdZNAyqFKpXy9xHZba1YxOBtJgwRe3nN+y1czSHZKB8/hOzJD9Koy9T9sDPnL/ECQym1SzmI/C8q0m8q8s5SRve0zrOS1N4Ls9v2gdhZehrwac8bVWs25wZA8cRGY3LIAozvuG9bvcf/a5BR25rFstHcjoCzk/2cPRwYOt27tLRZMSlBsOcr3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2lxOUU5OVpXcUJzdVVSWU8xR00wSDUxVlBjN0lWRy8rMEdXekp6MDA4NUs5?=
 =?utf-8?B?UGYxK1NiamV5UHdwZjg2ai9rK0ZsT3k0V2Y4czNpcm1rTTRrV0pVWkZManJo?=
 =?utf-8?B?ZmVlOWxNclBzaUUzMC9HSHNyc2R3L216cFR6VGtqZUFnNWI1UkMzdzVTQTVr?=
 =?utf-8?B?QSs4OThxZVdSOHliVGY3RmVnWjZ4ZVRkSHBTYU1HUE1Gb2lvdmQxR05qVGZx?=
 =?utf-8?B?ZlJBdE1kanJYZW84eFZRNDdjVCt0TU1NTmJRTnBBc2cxOXpJWFlnVnRPL0N0?=
 =?utf-8?B?OGZqb29SL0I3blQvYXc1NU1nbjhiOFFpUk93OEJheGErL3puZ3FTeEJ3U2FH?=
 =?utf-8?B?WE4yNWhIMXpwRGhMdnlzR3dIYnpHWVJhb3k2YzAzcVBZUHVXWERrTXF2aGhB?=
 =?utf-8?B?eFp1WXpySjBTNU12QS9yWllxcFg3Vkp5TzZ0T0tBSnpOakEyd2ZvZHJBTlpj?=
 =?utf-8?B?bWFxd1dXZXJXTnZVcmtlNCtYaEU1RjMyQld4RXRkNkdEMVRMZUVtRHYyaGhj?=
 =?utf-8?B?RldZOGhwTmJkUXJpNy9zMElML00yQzJlanREWFdCT09xajJuM0ZReFNyaDhK?=
 =?utf-8?B?T0dNdStZbEYzTHZLbmQzQXhjeEJjZmMvczFwM2o1L21sZWxtM3k4NklORlF3?=
 =?utf-8?B?S1ptV1pZUjZ3aU9DRUtIVlllbytza2lmV25CM0NxYnlBblB6NmpaQjJ5QjJw?=
 =?utf-8?B?cFVXbm9JRlhQL2RZWEsxL0Z3TE84ZjhYOFJsSmlVVHBpd3FwMDU2UndJa1hC?=
 =?utf-8?B?RnpGd29JWkE2RmlEbmRHTVNlY0oyK3RXSzJTQW9JNXExc2kxRzJTRStkT3Uy?=
 =?utf-8?B?S1pEbEpHVzNNYk9DMERDd0lkWG5za3c4VkFHRmROckt0VVVyMW96UUJHRlND?=
 =?utf-8?B?Wnd6VkR6T0FqcjYzellIazR6V3FsN0lwMmphRzk3UWFMRmoxMjZEM1FmNDhJ?=
 =?utf-8?B?MUc0YktvKys0VVBzQ1B5d053bEZ0NHhETy9qaUpCNlVmZVhKRXhMY2dSMUpC?=
 =?utf-8?B?ZzRGU1lSZW9MZHluT08rQ20ySHlDeXhVUDhkOXNsaFF3b09zZTZlOUJMdGU3?=
 =?utf-8?B?RktRZkgybW9OL0F4M1c0VWdtNnpGTkp2WDJ0aHQwODNUVmpjYmF4NGRBTEJ5?=
 =?utf-8?B?VlUrNmRZaVRIMnduUXAvSVlpRzNsZTlveWorcGFoT1Q1aUJYRm5EWmEzR000?=
 =?utf-8?B?eEx0MU5IeERHalhUWnVBYS9LVE9LK2gycXVEKzNGRjlmQXc3QUlxam5mYnJz?=
 =?utf-8?B?ZEVUcVRHbzE4SHFkREJ2MkVoM0dZK1lHNmJVOThxbGNHT1F6ZlNELzkwK0RG?=
 =?utf-8?B?dzJqN3JsdXI5WVU5a01yNCs3a1l1Q0hLdk9CVm1KalNhNmU2Ni9pUkJMSm9X?=
 =?utf-8?B?dlNpVXFjK0hWa2IzSmpCc1NsMjg5d3VkSFl6T3B4UVBDNGUvZUZPWk5nVCth?=
 =?utf-8?B?bnpDRVZ4Q1h0L0FuYkE3RjFUeFFTdXJGL2JXK2xYZHZyeFFRVXpTUE11bm9x?=
 =?utf-8?B?MUwycVVjUVNsOFBMdmJWQWFOR3l4MUl5U2NHeno4NWdwOU5LZ0E4dFRjTUw4?=
 =?utf-8?B?aFdmMklsc3NmM0ZDMDNrcXEvSnR5UVhSM29jZ1dJb2xOQTFWQ0tVanlZRytT?=
 =?utf-8?B?YzVDR3pVYVlUdC9XbS9HeHl5b3ZuQ3o3ZHM2Y3dJcGtidVdlK0dSSDZuTUNw?=
 =?utf-8?B?ZFJLVnB1N2hiUC9NT3drbThNcEV0c0xFKzdkNDB6SHN2MzU3SjcralVuS2sx?=
 =?utf-8?B?ZmNzWVhhdjJNQmlLblJGUDVNSVBVR2VhdEpjc05Fb29DWXNKMzVoQXRzNXkz?=
 =?utf-8?B?NnhVeTBCeVJ6cDlZWGFDemZyUkhjZ0dZcFdPQWdrT0JkbE1kRVdYS2ExclRS?=
 =?utf-8?B?RmgvNk5LMWVIQnU4MUN3ZDFvdEw5WmRkbVljd0NBaURVcURxME9GTkgrdXRD?=
 =?utf-8?B?bkdhUUVXdmw4Q3A5ZGxqMzdpalBXeFpwTERzUDI3aCtIays4aTJiZlB4dDNH?=
 =?utf-8?B?WDBMenRPMGFkNGJWWlFTN096K3l5aDl4aVBYSjdueTBEL3kxNVJYdmJGRXNK?=
 =?utf-8?B?WEQwWjR0OVZCY2U3S2lGMUk5OVhYYm9XVEU0UHFVb1Fsb1ZzWm5VU2tuTFNT?=
 =?utf-8?B?TWNQY3pBYTVxaWpGRVFVdkxsNGpDSjBXZ29lL3dVeW5ta1phbWhydXZPeWxD?=
 =?utf-8?B?THRLc3Z1eWhtSWZVL2JlT3RiRml3N0JzMmhPNGszSDFmQldpRzh6OXJOYmdQ?=
 =?utf-8?B?YXp1UDJqRFBnQjNWUGVwZXZHbnh0UzFPUlFCNkFsUTk0Q1dZYk9WOEhSNmR2?=
 =?utf-8?B?NDVBams5UGpNek9oa3lOZHNtUUZPT0t2SjFCeE0raDdabitlOThodz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d98ae1-9e12-4245-8f91-08de7b52f676
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:35:38.9191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2XJsQE3RhUSt0X1WQcizT1OAXkROptLy6aCCEDFupqqc/zjLPaOnk//o0HfQb2ANW5B4pAZHLe4+Rbs5h/v4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11069
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
X-Rspamd-Queue-Id: 5E61921C7F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurentiu.palcu@oss.nxp.com,m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:dmitry.baryshkov@linaro.org,m:francesco@valla.it,m:linux-kernel@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid,linaro.org:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:34:11AM +0000, Laurentiu Palcu wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> The next bridge in bridge chain could be a panel bridge or a non-panel
> bridge.  Use devm_drm_of_get_bridge() to replace the combination
> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
> to get either a panel bridge or a non-panel bridge, instead of getting
> a panel bridge only.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Francesco Valla <francesco@valla.it>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 7b71cde173e0c..d59f26016de26 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -15,7 +15,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
>  
>  #define LDB_CTRL_CH0_ENABLE			BIT(0)
>  #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
> @@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>  struct fsl_ldb {
>  	struct device *dev;
>  	struct drm_bridge bridge;
> -	struct drm_bridge *panel_bridge;
> +	struct drm_bridge *next_bridge;
>  	struct clk *clk;
>  	struct regmap *regmap;
>  	const struct fsl_ldb_devdata *devdata;
> @@ -119,7 +118,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>  {
>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>  
> -	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
> +	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
>  				 bridge, flags);
>  }
>  
> @@ -296,9 +295,7 @@ static const struct drm_bridge_funcs funcs = {
>  static int fsl_ldb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *panel_node;
>  	struct device_node *remote1, *remote2;
> -	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
>  	int dual_link;
>  
> @@ -321,36 +318,30 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	if (IS_ERR(fsl_ldb->regmap))
>  		return PTR_ERR(fsl_ldb->regmap);
>  
> -	/* Locate the remote ports and the panel node */
> +	/* Locate the remote ports. */
>  	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
>  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
>  	fsl_ldb->ch0_enabled = (remote1 != NULL);
>  	fsl_ldb->ch1_enabled = (remote2 != NULL);
> -	panel_node = of_node_get(remote1 ? remote1 : remote2);
>  	of_node_put(remote1);
>  	of_node_put(remote2);
>  
> -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> -		of_node_put(panel_node);
> -		return dev_err_probe(dev, -ENXIO, "No panel node found");
> -	}
> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
> +		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
>  
>  	dev_dbg(dev, "Using %s\n",
>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
>  
> -	panel = of_drm_find_panel(panel_node);
> -	of_node_put(panel_node);
> -	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> -
>  	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"))
>  		fsl_ldb->use_termination_resistor = true;
>  
> -	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(fsl_ldb->panel_bridge))
> -		return PTR_ERR(fsl_ldb->panel_bridge);
> -
> +	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
> +						      fsl_ldb->ch0_enabled ? 1 : 2,
> +						      0);

Cc'ing Luca.

Since commit[1] added next_bridge pointer to struct drm_bridge, can you
use that pointer instead of fsl_ldb->next_bridge?
This would be similar to how the in-flight imx93-pdfc.c driver[2] does.

However, after looking at commit[1] closely, I wonder if we need to call
drm_bridge_get() for the next_bridge returned from devm_drm_of_get_bridge()
because drm_bridge_put() would be called for the next_bridge when this
bridge(the next_bridge's previous bridge) is freed in __drm_bridge_free().
@Luca, can you please comment here?  I see your R-b tag on [2] where
drm_bridge_get() is not called, does it mean that we don't need to call
drm_bridge_get()?

[1] 3fdeae134ba9 drm/bridge: add next_bridge pointer to struct drm_bridge
[2] https://lore.kernel.org/all/20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de/

> +	if (IS_ERR(fsl_ldb->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
> +				     "failed to get next bridge\n");
>  
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>  		struct device_node *port1, *port2;
> 

-- 
Regards,
Liu Ying
