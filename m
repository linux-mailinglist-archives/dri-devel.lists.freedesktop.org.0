Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA101AF8D4E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050AD10E9B5;
	Fri,  4 Jul 2025 09:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VhkMkVVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013009.outbound.protection.outlook.com
 [40.107.162.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8223210E1E4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0Qt0yUtMtvpoBRmLnjuqX+MIuoSMeEmRgXz/Mm5fgcGg98uMPBlzdOzFYO1uyCRnSdYlLXSdN2thg1S58OEteS3kyG41ddbtTi6wNl8Cz5+jRZS5Jq6ccdnxEU9ZvkIWH6CPDlf1dz6nRu8PaiD6koSMSClciRXFFxIryPyls9fUIcxEybb1FQGgvUdqZVquWCX4EjnM1u49MLQePsTk51nFVBhwgIodJ2lTxo0KIUH4oYFRwY6+mdiuAPHAGcPSMmua/zsZj2heXfK2iRmdqiy09jmz5BVs+ddpPtttU1PU7k4I3UKjUPwEpvGxu6s3E28AWva5+hKO49ZY0d9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBwooJtkHSShWxNckpV9rVknAz5eRsDiw+gIPGypDNI=;
 b=MCYGeH+rTLH8cYqy3yxQZUaZzKP1NGn7Ulpbib8VElOpgZrK/budtgHcsJNquaxVPOYi1k0qBnpSue5QQaEyRvkEY4Pyk13aMPZ1L/cWUcEhV+hRTYhQhElM1r19fEgG2ig9NH9dlG5ZvONGL2MJGvtMJp3XZyTQclejs1RZ+PO+KssfjzaIlWX7x3xN0sAYNM1mlMPe7yg/MwiL615HaxBirTjpVbRbqfF6Znwrefl72qb6zmPCz81+yudDMQwQa2w5NwSRpLBIVPVgOtHHmDBLgymV2AGombif0oRUUwJHeqakXLE7H4o/Pi6C7vhl+IKE+lisV68de2/8iQcmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBwooJtkHSShWxNckpV9rVknAz5eRsDiw+gIPGypDNI=;
 b=VhkMkVVtpWv7e+9auD0YDHAhWX8IxvyeSw0nmVeo9ZtGJAP0bECe0wD5RAH6KhzFYosHuX6UWFarxRY5iuCWE0oR1znTpqcwxIFtTTvj+gtSLA1QOMapJxKpK/gPZVPs+CDQXnHKtyqPnPHK5pk+VzqRbUdXM2gv2CKGCg9Yi0K5BMLBHXNDMXkUSrOI2ZIC/lAtFE8MWdi8rMNN45mLN4POSQ3svDSfoCJ67DNXIRtmWxUqpfjStv9unLofYROpUPlvX0g5u4k1/twt7mELBg1Ie2LwYlaB2tnUHChYS/D9k/1qKVeW02WEazpyOShaHYDr351FatQt3Uw7GmjE9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:03:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:27 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:53 +0800
Subject: [PATCH 06/14] drm/imx: dc: Add PRG support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-6-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB11011:EE_
X-MS-Office365-Filtering-Correlation-Id: c8094e1d-3d5e-4c63-aab6-08ddbad9a378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkFpRkxtSVd6dlU0TCtPdVdOdGdIMnhIU01mc0oyNXRtYTAzMkRhN0hDQWNu?=
 =?utf-8?B?aWNtZEVyZUY2bmlTZnByQjd2a3N3NXlESW4rRWJQMUpwSklyaTVlUVFHRGor?=
 =?utf-8?B?TVdRWWNWTHdyNi9hbFhwMWpzVmFUaDJDM2k5cDR3QVdEd3haYityU0VwMHZ1?=
 =?utf-8?B?SE9iNE4vM2RBaXJJU0R5ODlQUEdqMTdlTG9HdE9EV1NaclhINUl5b3NtaEFC?=
 =?utf-8?B?bFNXQlZBb2pLZ0pBWVNaUkNOTlJ5OFdJVWFGeDBFREZIUXkzWnBFOW40dXhK?=
 =?utf-8?B?U3dHdjhxcllOTEh2Rm9yRTF1VGtwTjlnc0N3WEVXNGR6R0svbXNPQUhNSzQv?=
 =?utf-8?B?ZEtNcWhWbkpOeXhhTGU3MUZTRURwNUc2dzVwS3dpbEtMVFNIWEhZaVFyRG10?=
 =?utf-8?B?WGFkN0ZaT0NMR0x3eEh1WjZQcG9oTzRyaHJVTGRhTGFFQXgwcUZhNWpUeFAr?=
 =?utf-8?B?U0QrTjNoaGQrRlJCYlhJN1FwemRhWkNMTWtWc2NzOWpMNmRYdlZrZWY3cmNv?=
 =?utf-8?B?UldpRzRRQUZmQVpCOGJtNmw1ZXRVQmZtaDYwTVJyYjZCajhjLzdWUHZRWkEr?=
 =?utf-8?B?cjFGOUUwOG1ReG5hUjVKUU9YeGUrK1Y2dVB6d1RQNklOWmlWeVFDZEVUVVJH?=
 =?utf-8?B?aUMrTTd3Zm1Kdnp1UzBPVFk0a1hobUlnd1JJQ09WVm03OERyYjdyY2ZBcWVT?=
 =?utf-8?B?K1d1ekJpVXROZno1aENPak50aERqNFpwRUVSdkRJVnFvUXJPVVp0RTdWWkt6?=
 =?utf-8?B?bTRlU0ZaTFBrcUZ4ck42aEtKdnVpK240ZEx6VTRQeDB5a3RxTmpiTlhqdUJ0?=
 =?utf-8?B?a0NXWm5ncitScjlYNjMvRWNUekliUW9FbUd6dFg2czFtN0g3N1R5MGdWVkxV?=
 =?utf-8?B?SW5Jcm1IdVhHYlFKem1Cbll0eTQ4Q3UrTHhNRkYwNkpaU2lWUGhYbEhxRnYz?=
 =?utf-8?B?NXNsQWhrVEVUcjI4VHB0SWMyajRqWlkzcGlrOU1hZ0V2UjVHMjMySXRaRm91?=
 =?utf-8?B?V3B4Tjl3TThZOU5QZ2I5YkVWR3dXY1NGY1BTYzVka2N3YlQ5bG9TVDNidEND?=
 =?utf-8?B?OWdTbS8wWDI2VlovM1ZxdXJhYUZ5NFV1NW1wZEExcitSVGNzc2tjdFNsOGpp?=
 =?utf-8?B?ekUzdGRBYWlvN1VZaDd3bU9qM3c2VUJoSnFxTHZpSVpucVd3bUlxSnhvSGk0?=
 =?utf-8?B?elhkOHErSmtqL0dVYWQ2bCtPcENwMWcwWkQzUXJnZFpxdjNKTjZEQzNUL21K?=
 =?utf-8?B?WERRbTRkMFI2U3VxdlM3QkN0VElJUW51bHdPcURvWjl1bENFOU1yRDlwQmly?=
 =?utf-8?B?OTRMbHU0Y3k4SlhGUmVhMkNmVE1JdWhPZndaME5kTUg2NmFna01PM2xNRnQw?=
 =?utf-8?B?dm9YbDdtb1RwNU9iSmN2Y3plN2VONENTNWt1SnlzNHEvcDJYWCtZYkhDL1hB?=
 =?utf-8?B?OWlubE1ZMzJscWpvQ2w3RUVWYy9pb1BXNWRrZXNHNGIzU05GQTUyNi9KcGtW?=
 =?utf-8?B?UDFhamIvTThMTVhqWFlqSnN3SmRQRjBzM0R5T1RuM3ozdUJVaHJXMjc5T3pw?=
 =?utf-8?B?U2hqVVBwUDA0NG1zY245b3kxaHNKaGEycm1tY3VvWDBsSnFyUzNVVU5kc21L?=
 =?utf-8?B?VEtNUFVPWmtaOC90NnUrZmg4MWlDSTdISzg3UG9heEx1V1BjL0FGSW85OCtF?=
 =?utf-8?B?cEpVekJvZ2xMY3YwWCt2SDRsdm5RN3BaWEtxTWhUbTJ6UUFDSjFhekRXNDUy?=
 =?utf-8?B?T0g3K2Z3d2Z3enQyT3JOSkFyYXlVdmdHNE1NZnJsWENJVGViMlZmZjY2VHda?=
 =?utf-8?B?K0FGSTRpSGhEN2pFZFI3NEgrbEJHVkMxNUdOOTNMOUE0U3E4MGJhQjRLUzhC?=
 =?utf-8?B?Q3dlN1prVC9JTUJTcVFOT0t4NVJCaHcxRGZKRG4wTm5IYkEzTzZXUmxJanhC?=
 =?utf-8?B?QWFmUW1iRHhGSGZjb3crUklnb0pBcFJEZWhhc1gzNEJkMzdYTjIvRmFibngx?=
 =?utf-8?Q?HJ8RKiJhigECYKx3ATNfKvJ1sKv/BU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVEyVVNOdzh5RXk0ZmE4aW1lL0V5NnhQR3RKM0xNOTF3d21oZml5VE9kRTM3?=
 =?utf-8?B?MEw3Z2dyVnFrL2xObWVRMTBXU0drNXdPVzB4Vm9KRXdrUDlXQU42T1V5VXF3?=
 =?utf-8?B?dGEwR2pVOXNXZmRUTk9XQ0VQK01TakVxVFR1b3lVeXpVTXpoYWtVQXp2ZU5U?=
 =?utf-8?B?bWlMZXJ1RDFFSWVxUkd4UitacUVzZnFqL0RlQmtoZXFKeklSUW9rakp0a0VJ?=
 =?utf-8?B?Ly9DOEYvN2MwRHpIeXRUSEJ2YjVaMkI3TXBadjFIUkhvK2I4YmJ6bUdlbTZa?=
 =?utf-8?B?RytwSitNSlhlOWFNTFR5dEV1bHpteFQzWno4K3RaaWpjaE1vckE1MjcxM2M3?=
 =?utf-8?B?TXA2VlFtdzlEZWx4OW1QMFRTUWxDaDNOL0hpeFJaNkJ4V2lESHJMOWk4Z05i?=
 =?utf-8?B?dWx5UkZKUFVnZVB3ZCtyd0hpNFBIWTBYQkFmRUF0bGVzeE1uUUNBcUlIMWdT?=
 =?utf-8?B?b1NUaUw0enIrWDZqcm5xaG1FNmhIZ0haeFJxY0piTEtmRlhyTkpjL2pPcEpB?=
 =?utf-8?B?bnF1TUVpRGhLS2pyRkFXZDR0OGVnbGZPbHFTREVMdnhJdk5LbG9tTWxkdHZR?=
 =?utf-8?B?V2lGV29xSmRnejFFbDhuNkhOT1o1bHFldXRKVTRpb2FISTdheWZuNTFnUjZh?=
 =?utf-8?B?MHBDZnc5QUhBdVIxVWM5aFJxQ1dsdHc4OSt0N2FwRUdkejF6Qks2NTNGK3R3?=
 =?utf-8?B?bUVYSDZTNWlrQVhZRjc1VENQOUoxN2RsdnFyMlpQQmJzV1JCOEMvVWZFcGhR?=
 =?utf-8?B?b1g4ZTE5K3NETkJ1a1pVYkdncXlZaWdTZkhTQkgyd0MvZER0Z1pSaVRPcVFH?=
 =?utf-8?B?a2lRT0xpOG9zQ3l2L3JOQ1Q2czk5VXc3MGNJOEI2aVF3dDdVVzlXaVhQRElY?=
 =?utf-8?B?UzBQRzZ2eVljSE5xUnI0UDVldVY2L1h3Yk5QVGlQaG9iVEM4YjBFUkJCVURJ?=
 =?utf-8?B?b2o2dWdRbUJPZlpaKzZGQzArYkw4WlRDUDc3dzNzQm5ob0tTeW55MkpGbHg1?=
 =?utf-8?B?cmRNcnQxWTBCaE9jM1BHZW5FdXg3UzBQV052NHN6WlE1bXo4QkZTdE9SQkdr?=
 =?utf-8?B?czV1ZXZwMHZOeWRkZFdZaUhlOVlyRVRFY29WVUdtdUx4eEY2bzNtckxDMksz?=
 =?utf-8?B?WGtRcm1QRFdpRHpqUldrSW0xL0VPM1N6K1N5SW1QWmhNZ2pIdnFvUGRtbkVp?=
 =?utf-8?B?YndkbHNJZUhRa3NsY0pxenpuY09aQmt3MC84SzF4UEg3MkE2bUlsT29LOEhT?=
 =?utf-8?B?TzZlV0pTRFJuSUpWREtVRGttZ0R4QlZtaTg5SENQVW15a2d1TTJ2dy85YWl6?=
 =?utf-8?B?QzdvRnVSR3orU2Z0QVV4OFVKRUcxMlNPV0hONElHRExGYXVGejJuYXVJd2gz?=
 =?utf-8?B?SklJaTlBUTNDRmw2OXQ3M3cvMFd1R29CTk1QVFlyVHlhRjZmSk9SVWVSNmdn?=
 =?utf-8?B?bWlpdGRGYXNEUjN6UHJFeCthVTRwTE1JTGdlck5GZHQrWHFBV3FTd1ZNQk44?=
 =?utf-8?B?cHhGMm1rSXJwT1hMa3BzTzI3elVHWUw3NG0zd2NUYXZ6THpHT3Y4YnBVU3RK?=
 =?utf-8?B?TnpoQkJUaEQrV29SVmlFZzdpdlpVbWM3VkhjVnlsYUsvQzdXem1kd2hVcFU0?=
 =?utf-8?B?bmFSZlg3TDYrY3RFTmRLQ3kyMkwySUNTT0xUejZLanFiNU9hTUZxVjVXRjBM?=
 =?utf-8?B?RzVHRExkV1BiOUxnMkxMQ2NuTzNCU1B2eWk0Ui91dkU0VWtTZDE4M01aUjZ4?=
 =?utf-8?B?WU9tN1ZJZ1puZHNjYXRCNU9hZ2pvZ0c0R1p3QzYwUUszTDNrT3hpdWxuUXZD?=
 =?utf-8?B?aXZORlpZeEozcEtCUnhIVzJqakpYVnFaaVBrZlB3YTRsajdQTzYwV3Q2OE1J?=
 =?utf-8?B?TU45ZUhWVzBpZDhHZjU3a0l4OFdSZEFFaWtFZS9BZjh2eGxjaU1KckZIaDFV?=
 =?utf-8?B?bERkOXBvandGWWllbmJ1RHdHWE1qeEpITFBwVmsxcTNmTDU2SnFwUXEyd1BT?=
 =?utf-8?B?TlRwVnJmVGFUbFoxcUNYWVdvR0M0a1NIQ3hIUlY3eGJsNmw3ek1raVhRU2Jw?=
 =?utf-8?B?ZU91UzhhSXd4cjEzN0NjZmlSZnBSMEdFZEJxSEd3ZGF6eDFOU25jK2todHNJ?=
 =?utf-8?Q?1tOcjTqLpny3CC9u7UhO2jIgW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8094e1d-3d5e-4c63-aab6-08ddbad9a378
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:27.2037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7aAtMYnYXu4JjlGoWkGRFhggZgJ1JR4vnbR2FM0PJLdruuk3uSV9Yp23KMq59qtx8tnpRepKGz9kUqM0flT9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011
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

Display Prefetch Resolve Gasket(PRG) is a part of a FetchUnit's
prefetch engine.  It sits between a Display Prefetch Resolve
Channel(DPRC) and a FetchUnit.  Add a platform driver to support
the PRG.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/Makefile |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
 drivers/gpu/drm/imx/dc/dc-prg.c | 323 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h |  35 +++++
 5 files changed, 361 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index b9d33c074984a7ee5a6f0876d09bfeee5096264c..e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
-		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
+		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
 		    dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index f93766b6bfbfae8510db05278d104820ca0719c4..9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -276,6 +276,7 @@ static struct platform_driver * const dc_drivers[] = {
 	&dc_ic_driver,
 	&dc_lb_driver,
 	&dc_pe_driver,
+	&dc_prg_driver,
 	&dc_tc_driver,
 	&dc_driver,
 };
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7..557e7d90e4ea8ca2af59027b3152163cf7f9a618 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -81,6 +81,7 @@ extern struct platform_driver dc_fw_driver;
 extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
+extern struct platform_driver dc_prg_driver;
 extern struct platform_driver dc_tc_driver;
 
 static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
new file mode 100644
index 0000000000000000000000000000000000000000..9a1a312c0aeebf47bcf50ffa77971aa3bb431a12
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-prg.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "dc-prg.h"
+
+#define SET			0x4
+#define CLR			0x8
+#define TOG			0xc
+
+#define PRG_CTRL		0x00
+#define  BYPASS			BIT(0)
+#define  SC_DATA_TYPE_8BIT	0
+#define  HANDSHAKE_MODE_4LINES	0
+#define  SHADOW_LOAD_MODE	BIT(5)
+#define  DES_DATA_TYPE_MASK	GENMASK(17, 16)
+#define  DES_DATA_TYPE_32BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 0)
+#define  DES_DATA_TYPE_24BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 1)
+#define  DES_DATA_TYPE_16BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 2)
+#define  DES_DATA_TYPE_8BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 3)
+#define  SOFTRST		BIT(30)
+#define  SHADOW_EN		BIT(31)
+
+#define PRG_STATUS		0x10
+
+#define PRG_REG_UPDATE		0x20
+#define  REG_UPDATE		BIT(0)
+
+#define PRG_STRIDE		0x30
+#define  STRIDE(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define PRG_HEIGHT		0x40
+#define  HEIGHT(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define PRG_BADDR		0x50
+#define PRG_OFFSET		0x60
+
+#define PRG_WIDTH		0x70
+#define  WIDTH(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define DPU_PRG_MAX_STRIDE	0x10000
+
+struct dc_prg {
+	struct device *dev;
+	struct regmap *reg;
+	struct list_head list;
+	struct clk *clk_apb;
+	struct clk *clk_rtram;
+};
+
+static DEFINE_MUTEX(dc_prg_list_mutex);
+static LIST_HEAD(dc_prg_list);
+
+static const struct regmap_config dc_prg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = PRG_WIDTH + TOG,
+};
+
+static void dc_prg_reset(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + SET, SOFTRST);
+	fsleep(10);
+	regmap_write(prg->reg, PRG_CTRL + CLR, SOFTRST);
+	fsleep(10);
+}
+
+void dc_prg_enable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + CLR, BYPASS);
+}
+
+void dc_prg_disable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL, BYPASS);
+
+	pm_runtime_put(prg->dev);
+}
+
+void dc_prg_disable_at_boot(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL, BYPASS);
+
+	clk_disable_unprepare(prg->clk_rtram);
+	clk_disable_unprepare(prg->clk_apb);
+}
+
+static unsigned int dc_prg_burst_size_fixup(dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = 1 << __ffs(baddr);
+	burst_size = round_up(burst_size, 8);
+	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+static unsigned int
+dc_prg_stride_fixup(unsigned int stride, unsigned int burst_size)
+{
+	return round_up(stride, burst_size);
+}
+
+void dc_prg_configure(struct dc_prg *prg,
+		      unsigned int width, unsigned int height,
+		      unsigned int stride, unsigned int bits_per_pixel,
+		      dma_addr_t baddr, bool start)
+{
+	struct device *dev = prg->dev;
+	unsigned int burst_size;
+	u32 val;
+	int ret;
+
+	if (start) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get RPM: %d\n", ret);
+			return;
+		}
+	}
+
+	burst_size = dc_prg_burst_size_fixup(baddr);
+
+	stride = dc_prg_stride_fixup(stride, burst_size);
+
+	regmap_write(prg->reg, PRG_STRIDE, STRIDE(stride));
+	regmap_write(prg->reg, PRG_WIDTH, WIDTH(width));
+	regmap_write(prg->reg, PRG_HEIGHT, HEIGHT(height));
+	regmap_write(prg->reg, PRG_OFFSET, 0);
+	regmap_write(prg->reg, PRG_BADDR, baddr);
+
+	val = SHADOW_LOAD_MODE | SC_DATA_TYPE_8BIT | BYPASS |
+	      HANDSHAKE_MODE_4LINES;
+
+	switch (bits_per_pixel) {
+	case 32:
+		val |= DES_DATA_TYPE_32BPP;
+		break;
+	case 24:
+		val |= DES_DATA_TYPE_24BPP;
+		break;
+	case 16:
+		val |= DES_DATA_TYPE_16BPP;
+		break;
+	case 8:
+		val |= DES_DATA_TYPE_8BPP;
+		break;
+	}
+
+	/* no shadow for the first frame */
+	if (!start)
+		val |= SHADOW_EN;
+	regmap_write(prg->reg, PRG_CTRL, val);
+}
+
+void dc_prg_reg_update(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_REG_UPDATE, REG_UPDATE);
+}
+
+void dc_prg_shadow_enable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + SET, SHADOW_EN);
+}
+
+bool dc_prg_stride_supported(struct dc_prg *prg,
+			     unsigned int stride, dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = dc_prg_burst_size_fixup(baddr);
+
+	stride = dc_prg_stride_fixup(stride, burst_size);
+
+	if (stride > DPU_PRG_MAX_STRIDE)
+		return false;
+
+	return true;
+}
+
+struct dc_prg *
+dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
+{
+	struct device_node *prg_node __free(device_node);
+	struct dc_prg *prg;
+
+	prg_node = of_parse_phandle(dev->of_node, name, index);
+	if (!prg_node)
+		return NULL;
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_for_each_entry(prg, &dc_prg_list, list) {
+		if (prg_node == prg->dev->of_node)
+			return prg;
+	}
+
+	return NULL;
+}
+
+static int dc_prg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	struct dc_prg *prg;
+	int ret;
+
+	prg = devm_kzalloc(dev, sizeof(*prg), GFP_KERNEL);
+	if (!prg)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	prg->reg = devm_regmap_init_mmio(dev, base, &dc_prg_regmap_config);
+	if (IS_ERR(prg->reg))
+		return PTR_ERR(prg->reg);
+
+	prg->clk_apb = devm_clk_get(dev, "apb");
+	if (IS_ERR(prg->clk_apb))
+		return dev_err_probe(dev, PTR_ERR(prg->clk_apb),
+				     "failed to get APB clock\n");
+
+	prg->clk_rtram = devm_clk_get(dev, "rtram");
+	if (IS_ERR(prg->clk_rtram))
+		return dev_err_probe(dev, PTR_ERR(prg->clk_rtram),
+				     "failed to get RTRAM clock\n");
+
+	dev_set_drvdata(dev, prg);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	prg->dev = dev;
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_add(&prg->list, &dc_prg_list);
+
+	return 0;
+}
+
+static void dc_prg_remove(struct platform_device *pdev)
+{
+	struct dc_prg *prg = dev_get_drvdata(&pdev->dev);
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_del(&prg->list);
+}
+
+static int dc_prg_runtime_suspend(struct device *dev)
+{
+	struct dc_prg *prg = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(prg->clk_rtram);
+	clk_disable_unprepare(prg->clk_apb);
+
+	return 0;
+}
+
+static int dc_prg_runtime_resume(struct device *dev)
+{
+	struct dc_prg *prg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(prg->clk_apb);
+	if (ret) {
+		dev_err(dev, "failed to enable APB clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(prg->clk_rtram);
+	if (ret) {
+		dev_err(dev, "failed to enable RTRAM clock: %d\n", ret);
+		clk_disable_unprepare(prg->clk_apb);
+		return ret;
+	}
+
+	dc_prg_reset(prg);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_prg_pm_ops = {
+	RUNTIME_PM_OPS(dc_prg_runtime_suspend, dc_prg_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_prg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-prg", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_prg_driver = {
+	.probe = dc_prg_probe,
+	.remove = dc_prg_remove,
+	.driver = {
+		.name = "imx8-dc-prg",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_prg_dt_ids,
+		.pm = pm_ptr(&dc_prg_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
new file mode 100644
index 0000000000000000000000000000000000000000..6fd9b050bfa12334720f83ff9ceaf337e3048a54
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-prg.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DC_PRG_H__
+#define __DC_PRG_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+struct dc_prg;
+
+void dc_prg_enable(struct dc_prg *prg);
+
+void dc_prg_disable(struct dc_prg *prg);
+
+void dc_prg_disable_at_boot(struct dc_prg *prg);
+
+void dc_prg_configure(struct dc_prg *prg,
+		      unsigned int width, unsigned int height,
+		      unsigned int stride, unsigned int bits_per_pixel,
+		      dma_addr_t baddr, bool start);
+
+void dc_prg_reg_update(struct dc_prg *prg);
+
+void dc_prg_shadow_enable(struct dc_prg *prg);
+
+bool dc_prg_stride_supported(struct dc_prg *prg,
+			     unsigned int stride, dma_addr_t baddr);
+
+struct dc_prg *
+dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
+
+#endif

-- 
2.34.1

