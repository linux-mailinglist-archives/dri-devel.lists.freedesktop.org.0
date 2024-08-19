Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4C95725F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 19:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D62110E340;
	Mon, 19 Aug 2024 17:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PAUP264CU001.outbound.protection.outlook.com
 (mail-francecentralazon11021084.outbound.protection.outlook.com
 [40.107.160.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7910E340
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 17:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTzL+F3PgOr9JAZhp5puMrKzJfc/S6yfRJzVPf8/nFQHelT5w96ajm/LcwJsy2XSi7Vd8MIdi+TieTOsoBX2OuqawKo96njpKqc+SeenQOprSwGUwPUGIQZ/ZveG76Cf0imsE+FIVcI0JaEGK2Ei06hfT19RGjCyBENSCPnObD+s7kA/bWSzb3lDL0lXqb2mxxMqPVTe6BAk3wOXig+YdHpOAAJGjae7eEKAQGIqcAlVE8+EqCRwkA+dFrcejWElSrdE+dvmRJO0HuYZOzMjjrW7oYhFfdDJEI+xKtF5+FZM2aWma+83RfB0wevZAcaXjCZAIYSE/50ESpxStF5OJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuAKuipX2Pv5VI25Nr/AWES1c7/0LGjdEF1atWqXJ00=;
 b=CcekLrEdahUZpSZk6UmCE0nUbEgp+6znfAFipZToPFun9AMywVpRTB4hMvGDfAyh9TPXmCjwqFsF2rp/FejVjCojOG0TEoFQDiKbkd3xqCYdipALImEcrb3YOW0PK3IDxzS25VGo4iq5Z4QKA8gz3lHb2Lk9s6TNN9Qjx74UC/UdlbZ5Y6bxZq8RbNH94h+oCwTqXJ7h68n8oSoB+ohQaIIbRA3BQ/g+h14Gc7WXo/oD8jcQc/29RFUStiS+18p1fSCk/x/srrAts8bq7rN95FqWZcmeS28oYDjcxZvlvSoJ3LNMUavU7C/uF5rz7H9f4asYTatn42D9rqnJjE8q7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witbe.net; dmarc=pass action=none header.from=witbe.net;
 dkim=pass header.d=witbe.net; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witbe.net;
Received: from MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::5) by
 MR0P264MB4923.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 17:49:12 +0000
Received: from MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4a3d:42ec:6933:fa65]) by MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4a3d:42ec:6933:fa65%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 17:49:12 +0000
Date: Mon, 19 Aug 2024 19:49:11 +0200
From: Paul Rolland <rol@witbe.net>
To: Christian Heusel <christian@heusel.eu>
Cc: Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Martin Krastev
 <martin.krastev@broadcom.com>, Maaz Mombasawala
 <maaz.mombasawala@broadcom.com>, dri-devel@lists.freedesktop.org, Brad
 Spengler <spender@grsecurity.net>, rdkehn@gmail.com,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, rol@witbe.net
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
Message-ID: <20240819194911.7999bec1@riri>
In-Reply-To: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
References: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
Organization: Witbe
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
X-Ncc-RegId: fr.witbe
x-ms-reactions: disallow
Content-Type: multipart/signed; boundary="Sig_/kfW3cN.5WtImt5YMA+9A4dO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-ClientProxiedBy: PAZP264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:122::9) To MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:17::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRZP264MB1704:EE_|MR0P264MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: b8708154-a17c-4ca4-1e40-08dcc0773c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sugCAx7NYZwSqUgmzkF9/eFmePNMvQi87TaDA61uUmjt4W5GYeUAVi4B+JYW?=
 =?us-ascii?Q?PtJIxYprKLVHX02MRLJ8u0zFNXAjb9suKxfYPCkIKLkOF/CQAvqNEhVOnsRN?=
 =?us-ascii?Q?lL7FW2Bia6mGN4sLEdCCDlOh+bqxztsEjhGU4fNYjyeT+FZgI7EgloKgvQDG?=
 =?us-ascii?Q?Iqz5KsIVF6XiuEdjoa/00hKBd3N4T/IzuTKqy3+LYb+zIS+aiJMy2PzxtuzM?=
 =?us-ascii?Q?c4sJTMV5sgVjw/pqwR2PwZsiedtuwUrORLolLbtSg2WhOuN/oKKVGDPFD74+?=
 =?us-ascii?Q?DEmxSUpUjrsC8oONKY4qmZAU7lNog1QYQSE6TUJLyWadCy64jUmlxvKpIfJP?=
 =?us-ascii?Q?rosDlAe0r6Shxv0RnlqLgmqqzhR/tWWRreuQztHPAKgVZ4+e0zRCYI9cdPZ5?=
 =?us-ascii?Q?LzqAD7T8YaReyksiqBlElJXhTzrzuWJr8CrQLvS7X5ayVqs1LSKC4/LtCoiB?=
 =?us-ascii?Q?0TB2yctaqaxyyI2nF23DhZWiR3rLhAhlXhH7oQ+W/XBFkY+w//NjiUcRhKsi?=
 =?us-ascii?Q?dTnOb5AVB4HXSeL1ptcnutLR+qCS5WP1jeg2ffEku9pTnqoIuN1aQQ+nyee1?=
 =?us-ascii?Q?6rFpalNiMGoq23qvA/RMnsQDQiSz6WMDHCronhCs4qxGmn9boff+7WTzUBzT?=
 =?us-ascii?Q?3vBUxUmZSt2UIAnMUp5vBxkK8j2X3uvDSRXQTUUJYnC6AnS3MVZlAxltAVkS?=
 =?us-ascii?Q?T/hEsmQs28v3+lrBawLP22hQ22SZanKLEWnLZUOvbHSBaPy8crV0SeIr2eYL?=
 =?us-ascii?Q?lSrvbFV+AT5h2UNmuUB2PPLE9pea3e9cc627UP2xbw6xcXFDk6pKZA8Execo?=
 =?us-ascii?Q?ZkzZnk70K2EeZkDQikC3e3zENJXNpnQqztlW9nqFT/zIdFjCnoUUZgo+/dqQ?=
 =?us-ascii?Q?SGaiX9CyPDtroTFT+BRJh+51+ojyY2u2G+PlAzSck0h+S9ZLZvXd+DFYgi3c?=
 =?us-ascii?Q?bwvKCVzv495QNzTBAbgCjhwf1kpTnrq/2k42q2ohfEZXoGLSX+pQDBKhxRnW?=
 =?us-ascii?Q?5I3nBo73oozlUCL/o9CFau3dZAGXOQBxPPOVttT2maoUeDMT0Rl7oD0bBgiX?=
 =?us-ascii?Q?AS2b/PjiSVIj/FgcXRgHy4Ub5uNF5gKg/81xsmCDTSm4Fg9mKBMrIG29g6jq?=
 =?us-ascii?Q?ZbhtBylaxpqxFC/WpTCJllH1mE3n4nHeM3AUw87SpSvlyk7KUzON+4mbndFX?=
 =?us-ascii?Q?Gg4RdO3VIyWBVTXOCK5KvSAWFN1Jsbn2fzKNgthMH5UOXcTHY/mO8sPGuSlA?=
 =?us-ascii?Q?Z4OAAhzaQJLsxi+kp2BgEmAHqXFEHsg8peKZTlg5SLWKfF5rVllQD/YxxVdU?=
 =?us-ascii?Q?l1ne7nlg/MWgpY53ckAYHl+U4vSKb5vh8HJRmc/3ZfBTRw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cEArghQzsXVeCoc5iEA45V6GPV36jlzYlfuidOGnWOw/7m+jp4vCw+ITd1q8?=
 =?us-ascii?Q?79FjQb9h54OpvFkekFeZ/Do+UtDiGcenR7bQzISJznmTV3eZx520whJ33n5x?=
 =?us-ascii?Q?i+CzbPV6obLircfpLfW4qOz1cq/djbHqmWB2iouZ+oAzU8hCIRCZhikODZbh?=
 =?us-ascii?Q?32Gen550hN6NoXbHiyuT4VfS18427DnCrwumTTZm6RdMj1ZKmIVQ68FDlj0j?=
 =?us-ascii?Q?w0Fpj5qSI2ixcs3MDtANjgUSyKxLEsq7IUP3fAId5nZoDoz0U5DCjBzegJtH?=
 =?us-ascii?Q?VkdOM5xMzEcaOg6DqMa48EvhB3RhwjCS7oJE3lYagmGDA+Rdo7vhqpGj3F0X?=
 =?us-ascii?Q?Se7SFrF6QwOjlQFFVX4SS5yz070hehbZZ5roT+HWzWeiiDzp9XqzXh01ETzu?=
 =?us-ascii?Q?QvWoLf5L6g2Sit2QefeypmxJxvyKDeKNfnyn1wOkr1bBTJnOSMPd5RDaFW+V?=
 =?us-ascii?Q?w2T6qKYPoab3wfSMtuf49ouC2zu9LQxVwY5X6Juf5RXDoeSj5Rsu91owz0Iw?=
 =?us-ascii?Q?dLKhz0vmU8FOgEdj4wmkw62AhkTar1RB0JqdxoR46YdoMQLbSZQ2sCO4ZOQA?=
 =?us-ascii?Q?T6S/iCc8wKZlP3FbEjkc1DI8ATMdF/7UdsECoYBkWDMVwGg95ZqdUXR10uvv?=
 =?us-ascii?Q?uJoQE0RhCTUVrfSB+aQ2AHA2ldk5WW7qnG8sembkyEV1eHAhDlGxw/neZ9tP?=
 =?us-ascii?Q?XkVdXCPIGA2LzIFAcSq0wKVNJwELYn7NZdzGLRMoFAsr38BGCVzPVxexj6mH?=
 =?us-ascii?Q?jhEwcbu61GCxQbuIiAgAsxx5VDVDc3QnR/aSI4jXGj/0zIb4SB6ocalTM1h8?=
 =?us-ascii?Q?4bOvb/paQFfHh+QTwJSC4BAl0JY1l/YrJSALWkHvVS2hAYtE4/OFoAIS53iB?=
 =?us-ascii?Q?jgRsJVNdEA0dFwZL9phKuEEEPJAWpKKw0LmJ6Djb/CFurmIuBXSlZ3R05J8X?=
 =?us-ascii?Q?a4RRQR4DnITzqeibHlopULTpxnZjcPnxr27T3LKQeR5aV7hn8fDY1tBiuF7j?=
 =?us-ascii?Q?rEw/XsQs1lSWALH01f6MavoeL8Zd09TQvKM5XwtQTzjVsVJIoSY0v5KBhwV8?=
 =?us-ascii?Q?3zq+TqcVWrAiZSiM4fGzqdH6IMqbIrUgIPnlm2CKTNBnyJhHm7fEe77zVsJF?=
 =?us-ascii?Q?3AIaZO9Jm98f8FnEcM7tguZ3PP/7m9lkxSkQv18LgvR4IKcPQ8M4ojc9Y/Pt?=
 =?us-ascii?Q?SGoKrOJ1f/gj9sf/v7Cc3MizDa9xkmAMOir1Z5ez6GlqLARrvLyLjHsJx7yM?=
 =?us-ascii?Q?KUMyvtZAd8W/pdGlQnst88JHX4psqNt9gNk/TYbXSuu12Ibo1gVnBR75OYG9?=
 =?us-ascii?Q?NSeavHmwmAArlnHBQA+imO98mG4+A43V1MNRQT8MjujJou3tjLzRZ7NtDEaI?=
 =?us-ascii?Q?v/9IIbkWKAY8CjheKi3VbleYkxF2t168hZPBfVMQGEVb3xrtQMrBOTCphMKo?=
 =?us-ascii?Q?InL7rE6Z+W44M6urQaw8oXNK2e3TybOg0SMUQPw3neqjQVukfxdq0YDJVyhj?=
 =?us-ascii?Q?NzFHs6S3b5wF/4WOaEd98s3rhVG5PFv4XoeBC+HcNgc3KAb3Ls4R9zlnlX4C?=
 =?us-ascii?Q?UfZbkwd4Bsw3dT9W0biGbnuuVZBrhlDXB8+XCpXh?=
X-OriginatorOrg: witbe.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b8708154-a17c-4ca4-1e40-08dcc0773c1d
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 17:49:12.3481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3f8d401f-95c5-4cdd-94d3-64af2479cf89
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C26mrQdNUq0BXnpCfTbCUQomKGLUOz+cYTAR2IdSS/Y4M37b1K/xiVTz+ITGIqaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB4923
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

--Sig_/kfW3cN.5WtImt5YMA+9A4dO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 15 Aug 2024 19:48:47 +0200
Christian Heusel <christian@heusel.eu> wrote:

> While we were still debugging the issue Brad (also CC'ed) messaged me
> that they were seeing similar failures in their ESXi based test
> pipelines except for one box that was running on legacy BIOS (so maybe
> that is relevant). They noticed this because they had set panic_on_warn.

I have the same problem at home using ESXi and UEFI Bios with my VMs:
kernel 6.10.4 and 6.10.5 are showing an error with vmwgfx while booting and
there is no console available, though it's still possible to remotely
access the VMs using SSH.

Reverting to 6.10.3 solves the problem.

Regards,
Paul


--Sig_/kfW3cN.5WtImt5YMA+9A4dO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEfJBudf4KU8bw8ox368Rc5Xmx8y0FAmbDhZcACgkQ68Rc5Xmx
8y2b+wv/auNGhWsEJVA1iJZktKXzRWjI6sW8sslf2tHbtlzStRbJw4oE/TKzL/xQ
3+pGW4k08zxmF2n5HotKCguk2iIo+GKsLc93d2bdtC6NJDKPcIzoaA/ePhiQDRqA
TMRXS1i4MWGXIdZCjjdrDouze7o/uO4PYPewFjB8FY7Oj3t301JkDh6xfHyUP56m
pUbndRFj7mowuTsGeSE0HlQTKIOE2HX3NUny2Q/+cDCHqajm1zZu7Jhy/1Fx4BJf
N6u65gmkEyTFO15qqFDSv2DBiAdyc3JaJ5NZ/i03mETsnh92DVnLsk9p4iI5RVTc
2NzqA49u7v7whkvtWeIy6ymJhzgkX49cPPj0GUBkdvIg1ZvO8hWZNT4G+ezaXaFX
yZQ43sxPQMTsJ2SRS+jCemjwzlFS34nHv5DQiiNiuQKWJMw6MqwtiuQFmcLKrGDT
/nzFK3MkV2ievZasO3mSdAoYMozhKD2c8bkuxqsBZ5yDUlK3XlogzSzeED2z/573
JURSwI5z
=9ID1
-----END PGP SIGNATURE-----

--Sig_/kfW3cN.5WtImt5YMA+9A4dO--
