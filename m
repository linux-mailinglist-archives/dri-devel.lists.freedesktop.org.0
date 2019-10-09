Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F08D5369
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 02:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C37B6E0E3;
	Sun, 13 Oct 2019 00:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6089 seconds by postgrey-1.36 at gabe;
 Sun, 13 Oct 2019 00:22:24 UTC
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F9B6E0E3;
 Sun, 13 Oct 2019 00:22:24 +0000 (UTC)
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9CMejmS021678
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 16:40:45 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9CMeiO5021677; Sat, 12 Oct 2019 16:40:44 -0600
Received: from CY4PR03MB2934.namprd03.prod.outlook.com (2603:10b6:a03:94::48)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR01CA0071.PROD.EXCHANGELABS.COM; Wed, 9 Oct 2019 19:21:11 +0000
Received: from CY1PR03CA0022.namprd03.prod.outlook.com (2603:10b6:600::32) by
 CY4PR03MB2934.namprd03.prod.outlook.com (2603:10b6:903:139::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Wed, 9 Oct
 2019 17:57:27 +0000
Received: from BN3NAM01FT023.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e41::204) by CY1PR03CA0022.outlook.office365.com
 (2603:10b6:600::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 17:57:27 +0000
Received: from ipmx7.colorado.edu (128.138.128.233) by
 BN3NAM01FT023.mail.protection.outlook.com (10.152.67.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:57:27 +0000
Received: from ipmx4.colorado.edu ([128.138.67.75])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 11:06:47 -0600
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 10:38:46 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:17:55 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731590AbfJIQRy (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 12:17:54 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37756 "EHLO       
 mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org       
 with ESMTP id S1729644AbfJIQRy (ORCPT       
 <rfc822; linux-kernel@vger.kernel.org>); Wed, 9 Oct 2019 12:17:54 -0400
Received: by mail-wr1-f67.google.com with SMTP id p14so3764096wro.4;
 Wed, 09 Oct 2019 09:17:52 -0700 (PDT)
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=pass (signature verified)
 header.i=@gmail.com
IronPort-SDR: BKBzq661Gkhu5K0IiC8nWiuO6v+a1IuHFuU2uQAGIS6gTsoMpKoDw7ygaBYaemB+Syf+GVLobS
 Ipu8TdOfg8cSJgebcqdind8qs8/2/1MH0=
IronPort-SDR: FUYidMNj+Asx0+ua4D9MmrWS3o+daUSMXULKMJa4PZOwMaA0DxCf6Jqu126hQbGUsU6Bn4/jSi
 65zOj7i1UxnlPhTgoxvVdIM0ntNYsdPdk=
IronPort-SDR: SxCYbDn/qcrBrHS/goywhBQBXcVV/GVdz39y6BvHTh+x7h7gZBRCsqH6jYnH3ef9fhrSr0A4Qp
 1dRoxUpOZ8lcAbs3oB3m0w8E3UXBm/cik=
IronPort-PHdr: =?us-ascii?q?9a23=3ABgzLRR3lPWRh4V4BsmDT+DJfSgsGnvDZIAcR95?=
 =?us-ascii?q?M7irVILPnyrYq3ZR+X7KB3l1aMRoXSsa8a2KLd5rrtXWUQ7JrGqn0GeYxBW0?=
 =?us-ascii?q?xg641e10RoSIbNBRj0Kffra2oxG8ERHEQwpSnibxENQputAj+a6jX6pXZaUh?=
 =?us-ascii?q?WqMAtwK6HrF5TJjsOxhfq/9ZDJbgNDiSHvYLU3NhiuqRSUqs5Ej5FlL/Q9ww?=
 =?us-ascii?q?fE8H5FYP9fym4tJF7BhAv25Mq74Mx/9EEy87ppv4YIGe2yLa8zHtk6RHxuey?=
 =?us-ascii?q?h9rIXhtUyEfSTf+VQ5VXQrjERMMivg/SP5GZ2v6TPgitFw2Q/FGtT0Ur4mWQ?=
 =?us-ascii?q?Sa4o1WHUyN6m9Pf3ZxuCmfgJl1vp5+uEj8v0Fj8dbtW9msDfwkQa/0ZoNBdE?=
 =?us-ascii?q?xrQd9rcgJ6Er+lP9UJIeMiHMFzodf2p0YxkRKdASSKH+romxhFqnaTv+Vym6?=
 =?us-ascii?q?xpWUmOlCcvPNQimVjvgYrZJPc1ff3t7qb2zS/MUPFQ4xTYytjNVi8P8fGTeq?=
 =?us-ascii?q?xPXZPf9W0UOALhrWq8rp77PT6P9+Up41bAwOV6MIDnwyZv40k56nDy4fsHkL?=
 =?us-ascii?q?CKtK0n91nh7iVU0N4cNPmKSkQgeYOoD4VeuAKdC7lTU8UAbFNIpikf14JZ5Z?=
 =?us-ascii?q?WicwM7+bp7yCzCQPiGa6mhx3eBHK7ZaX8wzDotQLzgxC28wEqK0Lb9TvCbgW?=
 =?us-ascii?q?RMtnIZkILKlWEGxiHs1pbZEqdzo2qT4wij0Av0170YeEIzjfCKIJoK450bq8?=
 =?us-ascii?q?QMkE7DOgyT+g2+xOfePg1sss20ssPgZ569q6S9N4FlgyzBNJ0loZaCOdQjbi?=
 =?us-ascii?q?sOREK22+KTy+SgzGL2R6pSyawSlIOAiI2ZBOkG/qO1BSFJ+JkCxAeTalXumJ?=
 =?us-ascii?q?xQ1TFPZBpKfz+u2t26c0GLIer/C++4mUjpijpw2vTaa6XoGY6edCKRuar9fb?=
 =?us-ascii?q?t7909XwRYyytYa3Z9PF7UdO6ysCErh8tffChgjOgCzhevrFYY12oAfXDeXC7?=
 =?us-ascii?q?SCeOPJsFCO7/4yOeTEeoIPuTj8JvRkr/7jhHM0gxkcKIGm2JIWbDazGfFr?=
IronPort-PHdr: =?us-ascii?q?9a23=3AOYjM2BbSlaVY2XUioKltnNv/LSx+5ufYHS8wr7?=
 =?us-ascii?q?c5grZTe7ii+JK8YR2N+6A03xfACJ/A4rdfi+OM7v6zEWdV+5uFuWAPfNtWWh?=
 =?us-ascii?q?sMmcgazGlCSIbNQQWzZLbmOiM/FcVGElRi+iLzKh0PQJ+gPgWI/y7Xj3ZaUl?=
 =?us-ascii?q?23fUI9JrHwG4vfytq6zfuz/JuBeQhGiSCwZ7h/N0e3q0DLu9ESkM5+LfQ/0B?=
 =?us-ascii?q?zM8HdBZ+kEwG5zPlucklP96pWr4ZRh/i9M6e4mkqwIGe2yN+xwBfQKBz91Vg?=
 =?us-ascii?q?J9rIWj/VGLBQGPszwsfTUJvT9PEjXbshXLfbLggCi9vLQmwDOmBsD3a+8TQD?=
 =?us-ascii?q?a94bVreCflohpSZFtbuCmfwoQ4xOpR9ReTmzlnmdPMPZ2nbMNFJprke4klSU?=
 =?us-ascii?q?NaDp1gcQZeG7mZQbAfM/NRY+B2pqrcgHAA8xC+GDaQDcDr5xlTj3in+qAW2o?=
 =?us-ascii?q?FDWUmOlERoV5pGm3v3qvncGJw/DsylnI7k0G3hYM1WwzjC6o7yUTUD8fSoYp?=
 =?us-ascii?q?wgcdX213YDTg35qm6/qKjGAB+SxPoPvnK67s4wa7mAhHRCyUk56nDnjo9kwt?=
 =?us-ascii?q?TuuqkP8xP22hdEyaMuJfCoEGdqReymGsBI6i2FKYV5YcQecUR5vgQV+J0Ytr?=
 =?us-ascii?q?umQ3dWw40o7C/uRaCIQZWj5hP7dc+0RFUwzDotMPr3z16K/xfj8ePNVOOui1?=
 =?us-ascii?q?dSlwUUoN/U7iwPjBrw+8OWd8RBoBn5hTjS+jLp1M1DKmcJyfaCKZk5mO87kr?=
 =?us-ascii?q?Eykm/+QDDXkkXSr8r0Pg1ssqDgo6yvR6m/gZiZHNR5sSD+PLUnt/O5OO8DaD?=
 =?us-ascii?q?U2b3PH2uSn/pDB+2LmGfZ7ofIxjbGe4bTcD50ju+2YLhIN34olxQqVEBaJwf?=
 =?us-ascii?q?h9/zFPZBoNMFrPx4fuFnibdaOwHbK+mVOqiDBx27XcM6b8BomYNnHYi+S7J+?=
 =?us-ascii?q?RU9lJcxQwvzNtW+5NTDPQ7LenuXlPq6oOKCw9/OAuwxPzuBNI7248DCiqDAa?=
 =?us-ascii?q?6cZbvbqkTApvkuLO+FeJIPtX7jJuIk6f/jgT5xmVIUcaSzm5pCQH+9F/ViZU?=
 =?us-ascii?q?6eZHc=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3AZHl7tBCPYsOvGDzNZKo6UyQJP3V1l5bVG0s49J?=
 =?us-ascii?q?MjlrtSc6OlocmzblKKvKYlhQrTRoye8PJN0beI4OjrDHYN5Z+RvXxFapFIXg?=
 =?us-ascii?q?8IhZZz/URoSIbNQQWzIKvlaiU7GIJJU1o2t2ruaxAMRp+mPQCBxx/6pXZaUl?=
 =?us-ascii?q?23fQogI+XwF8vMgt6s1ue0qYfebQhSiTy2bKggLRPztwjJsthTnYwwJLw2z0?=
 =?us-ascii?q?nFq2dFKeFb3nhhKl/Wnhqu/dq6/pNo73ZMvJdDv4YIGe2yN+xwH7dTX1FEey?=
 =?us-ascii?q?h9rIWj/VHJTV7I1lRMTUozlQt1HVbB3TLfT6Xy9SGk7fJn5BKXPOupaqk2Rj?=
 =?us-ascii?q?qw75dTRTXV3XRiVXZxuCmfwoQ4hvdeki6Ev0Yi29PIUtmsD6JHR6WHQt8zXj?=
 =?us-ascii?q?oab+B7SDV7J62Hf7cWX7QHE+97jq7WqQUFrQaBOQCPAM7J0TZP11j78aRfsa?=
 =?us-ascii?q?xpWUmOlERoV/kBk3L4hfnOGfg+QbCS4LSQ7zr9b+lZ5jX70qvtUEAkhc6iDb?=
 =?us-ascii?q?JvVtTu5RAhKyf+oVS0irPJOCGL1OkXkmm/v9Q7eu217gxv40k56nDnjo9xrb?=
 =?us-ascii?q?XinLtW+H/2yCxc24YYNYWRWWpJY9T/CMZcqD+UOKhxfvEHUmdKlxQa1LIjpK?=
 =?us-ascii?q?HkICMTx78W9jCDZM6aWIyJ+jPKcYPzaX8wzDotMPr3vxjtsnOu++/WTJK1yG?=
 =?us-ascii?q?9l/xhDioGQtCsL9A3Y+/W4dqUjphuvhBu97T7/7epjHBxozKjcM8Rwybobt7?=
 =?us-ascii?q?k4jBrcPyX2vGaT7ufePg1ssqDgo8H7O5Lho7THOrRVig/vO4kRnPW0Or4FCj?=
 =?us-ascii?q?gVA0ub4s6R9rvM4hS6cZpFieIu1fj9trqDHdlYh4OkWwJZ1Kg/wQmeICaKtb?=
 =?us-ascii?q?ZQ1TFPZBoNMFqIiKXAbgSdaOC9DO24hUyriisu3f3dI7n9V43ENWOQyu2zVK?=
 =?us-ascii?q?th60Na1As4xMxe4JQRMLwaPfbvQRGu5tnISBQ+NwuuyurgTthxy9BWVWGOB/?=
 =?us-ascii?q?qBObjJ+R+T5+0pKvWRfoJdpjvnKvYk6vKvxX80kFMQZ++oiLMYbXm5GrJtJE?=
 =?us-ascii?q?CU?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0HWAAD+Hp5dbUtDioBbChsBAQEBAQE?=
 =?us-ascii?q?BBQEBAREBAQMDAQEBgXuCGwWBXxIqhCODe4UHhVuCD4l7dI97MhMBAQEBAQE?=
 =?us-ascii?q?BAQEIGBUCAQEBAYcQIzgTAgECCQEBAQMBAQECAQUCAQECAhANCwkGK4U0DIN?=
 =?us-ascii?q?GOzABAQEBAQEBAQEBAQEBAQEBAQEBARUCgQEpAQEYAQEBAQMBAg8RHQEbHQE?=
 =?us-ascii?q?DAgkBAQUFCwMDAwECAQICJgICAx8BEQEFARQIBhMFHYVGAQMupAqBAzyKMXW?=
 =?us-ascii?q?BFQUBF4J+BYQ9ChknDWMDgTwCBxJ6KIwOGIFAP4ERgxI+hBmDOYJeBIx7OYI?=
 =?us-ascii?q?AiCeVaEaBZmqULxuCOpcGj2yYEA8jgUaBezMaI4EBgjtQEBSBTwsYg1CKbyc?=
 =?us-ascii?q?xgQiQEwEB?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FJAgBnDZ5dfU1DioBbCoRcgWMShE2?=
 =?us-ascii?q?JApJYj3tFAQEBAQEBAQEBCC0CAQEBAYczOBMDAgkBAQEDAQICAQUCAQECAhA?=
 =?us-ascii?q?BAQkWCIVpg0Y7MAEBAQEBAQEBAQEBAQEBAQEBAQEBFQKBASkaAQEFAQIPER0?=
 =?us-ascii?q?BGx0BAwIJAQEFBQsDAwMBAgECAiYCAgMfAREBBQEUCAYTBR2EagEDHaQGgQM?=
 =?us-ascii?q?8iyaBFQUBF4J+BYQ/ChknDWMDgTwCBxIObIxOgUA/hCM+hBmDOYJYjH85ggC?=
 =?us-ascii?q?IJ5VoRoFmapQvG4I6lwaPbJgQDyOBRoF7MxojgQGDCxAUgVoYjj8mgTqTXQE?=
 =?us-ascii?q?B?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FlBgBKBp5dh0O0hNFbChwBAQEBAQc?=
 =?us-ascii?q?BAREBBAQBAYF7ghuBQzIqhCODe4phgg8UiWd0j3syEwEBAQEBAQEBASAUAQI?=
 =?us-ascii?q?BAQEBhxAjOBMCAQIJAQEBAwEBAQIBBQIBAQICEAEBAQoLCQgphTQMg0Y7MAE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEBFQItVCkBARgBAQEBAwECDxEdARsdAQMCCQE?=
 =?us-ascii?q?BBQULAwMDAQIBAgImAgIDHwERAQUBFAgGEwUdgwCBagEDHaNzgQM8ijF1gRU?=
 =?us-ascii?q?FAReCfgWEPgoZJw1jA4E8AgcSeiiMDhiBQD+BEYMSPoQZgzmCWASMezmCAIg?=
 =?us-ascii?q?nlWhGgWZqlC8bgjqXBo9smBAygUaBezMaI4EBgjtQEBSBTwsYg1CKbyUzgQY?=
 =?us-ascii?q?BAZNdAQE?=
X-IPAS-Result: =?us-ascii?q?A0HWAAD+Hp5dbUtDioBbChsBAQEBAQEBBQEBAREBAQMDA?=
 =?us-ascii?q?QEBgXuCGwWBXxIqhCODe4UHhVuCD4l7dI97MhMBAQEBAQEBAQEIGBUCAQEBA?=
 =?us-ascii?q?YcQIzgTAgECCQEBAQMBAQECAQUCAQECAhANCwkGK4U0DINGOzABAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBARUCgQEpAQEYAQEBAQMBAg8RHQEbHQEDAgkBAQUFCwMDA?=
 =?us-ascii?q?wECAQICJgICAx8BEQEFARQIBhMFHYVGAQMupAqBAzyKMXWBFQUBF4J+BYQ9C?=
 =?us-ascii?q?hknDWMDgTwCBxJ6KIwOGIFAP4ERgxI+hBmDOYJeBIx7OYIAiCeVaEaBZmqUL?=
 =?us-ascii?q?xuCOpcGj2yYEA8jgUaBezMaI4EBgjtQEBSBTwsYg1CKbycxgQiQEwEB?=
X-IPAS-Result: =?us-ascii?q?A0FJAgBnDZ5dfU1DioBbCoRcgWMShE2JApJYj3tFAQEBA?=
 =?us-ascii?q?QEBAQEBCC0CAQEBAYczOBMDAgkBAQEDAQICAQUCAQECAhABAQkWCIVpg0Y7M?=
 =?us-ascii?q?AEBAQEBAQEBAQEBAQEBAQEBAQEBFQKBASkaAQEFAQIPER0BGx0BAwIJAQEFB?=
 =?us-ascii?q?QsDAwMBAgECAiYCAgMfAREBBQEUCAYTBR2EagEDHaQGgQM8iyaBFQUBF4J+B?=
 =?us-ascii?q?YQ/ChknDWMDgTwCBxIObIxOgUA/hCM+hBmDOYJYjH85ggCIJ5VoRoFmapQvG?=
 =?us-ascii?q?4I6lwaPbJgQDyOBRoF7MxojgQGDCxAUgVoYjj8mgTqTXQEB?=
X-IPAS-Result: =?us-ascii?q?A0FlBgBKBp5dh0O0hNFbChwBAQEBAQcBAREBBAQBAYF7g?=
 =?us-ascii?q?huBQzIqhCODe4phgg8UiWd0j3syEwEBAQEBAQEBASAUAQIBAQEBhxAjOBMCA?=
 =?us-ascii?q?QIJAQEBAwEBAQIBBQIBAQICEAEBAQoLCQgphTQMg0Y7MAEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBFQItVCkBARgBAQEBAwECDxEdARsdAQMCCQEBBQULAwMDAQIBA?=
 =?us-ascii?q?gImAgIDHwERAQUBFAgGEwUdgwCBagEDHaNzgQM8ijF1gRUFAReCfgWEPgoZJ?=
 =?us-ascii?q?w1jA4E8AgcSeiiMDhiBQD+BEYMSPoQZgzmCWASMezmCAIgnlWhGgWZqlC8bg?=
 =?us-ascii?q?jqXBo9smBAygUaBezMaI4EBgjtQEBSBTwsYg1CKbyUzgQYBAZNdAQE?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="scan'208"; a="287171237"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369210427"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369150481"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20161025; 
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date        
 :message-id:subject:to:cc;       
 bh=/XG8wGMoyUv6lYKMyZk/b63prTSeiN7OqjwfzhXPeBU=;       
 b=Ftiw+9F+MH/ywgIozgawOO8+jmiUnYVZK5Tt8r65COGVwd1OPi83EULgGHhsGaNxuh        
 herrydCEz23540MU12ELJv073lxFFSsFuXcf/LwB51Ti14JJKPaZOU3sie/VV6E3H2Fu        
 bmPo1hveh9XAhFzo+zlBVw+yY2moAhJjlglWyn6d6OY+pa4TrAWyFNn4fiIXE9o81P/0        
 4eHSnKhRYBTo3NoGDmYtfWvgJY874WARm8dlxp8Ex5Df7Xz10ptQc1r4pHbvuPAI2wr5        
 ojI/8kEngMtULmBn+y1OWqt3EO48ltFzkEeZHLcgtpSJkem9zXatwLDsgnYFbhrQ0rh3        
 v10w==
X-Gm-Message-State: APjAAAW65xIUsZ1O55sqnNQ+pd1HFbr5k+QkP06vbVZU0rMYzokNnCDY 
 mZwnAO0JJrx1zV+qz1QuDv4qrMNuNFvxNMwXxtFliQ==
X-Google-Smtp-Source: APXvYqwuFxizJIc608t7uMIyzZUpg60M7UXO170bbTV8WWpxvxozUM5YuBaV9KuuipR2H0z6C97a1BSFfNMask+sQyg=
X-Received: by 2002:adf:db43:: with SMTP id f3mr2544310wrj.11.1570637872054;
 Wed, 09 Oct 2019 09:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191009113557.41ced49e@canb.auug.org.au>
In-Reply-To: <20191009113557.41ced49e@canb.auug.org.au>
From: "Alex Deucher" <alexdeucher@gmail.com>
Date: Wed, 9 Oct 2019 12:17:36 -0400
Message-ID: <CADnq5_M0+PqajRUxgho2WVLq4ykdHJh=4-mWKrR25_93HMj68Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:57:27.3889 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 4206900f-1f65-46e2-b5ce-08d74ce225a1
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.128.233; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:CY4PR03MB2934; H:ipmx7.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BN3NAM01FT023.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4206900f-1f65-46e2-b5ce-08d74ce225a1
X-MS-TrafficTypeDiagnostic: CY4PR03MB2934:|CY4PR03MB2934:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:57:27.1747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4206900f-1f65-46e2-b5ce-08d74ce225a1
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.128.233];
 Helo=[ipmx7.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2934
X-MS-Exchange-Transport-EndToEndLatency: 01:23:46.7891579
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TOh6c3AdQPGrVl89RPOaUdJbuDOAL1NoXBd34PF30HNEnDlHisvhRI3g6O4R?=
 =?us-ascii?Q?X9tznfI0ZPnFf0x9nxY5L3dDtlVC/5IfNXHa8BUSLDD05wSUDAxe62Lt+7mH?=
 =?us-ascii?Q?HUH5faK9qSjSqwCkLXGTe42tG5ycfN24eXiW4F7o3ZyzBoufhoow5Au9RdCI?=
 =?us-ascii?Q?FyQQfOC2atr6NP+kezFF5zLgTicJopV4kn4R2fEllsZnZ2D8EpM7XhbDWwyd?=
 =?us-ascii?Q?5DOwX/22OD5PdfVp+5o+0PChtcgIeizN9JhbSk2Ruhj5P+GISKwUu3YbKfON?=
 =?us-ascii?Q?kZo3HpbYFcG0MGG8Fa+tx9jE20TBCtxIScqIGqG8/60Q01ZVwC8BJoZAZ1Ox?=
 =?us-ascii?Q?B+ZXPnhR7yfbZSgMgVmalZMlPw6lkHSC2i5kPuKFjjDgmbzN/jqZBn1YoKYO?=
 =?us-ascii?Q?I5NdakWtYyxgRetVgXTifWuecJDLhYpSfv2sIK28Y8cqkrM1OAje/GZHlBqx?=
 =?us-ascii?Q?CDA1SrIjqdQi5gO7+qssbvZkuqGLqwCCiLsA6JtVYPtUo31LIauzvH9yxutS?=
 =?us-ascii?Q?nJE/yrcCcWKrZjkFcTj3SMwk0lZrcHGYQhd8fTLKPAAWpqIBOJ0UhDj0awOD?=
 =?us-ascii?Q?1hMurgZnm8MtEkMEhyyeoBKb7VNYllwrw5sKp/B6Zmo/lr9oZZgbmzbK1eRA?=
 =?us-ascii?Q?jzCI+82EzaoW3TYFyYNGS7RfAh9HC3Y4kLqurd5282Wk/XYr82PoDOYqBPlk?=
 =?us-ascii?Q?Dcc7Pa2kcHV2WTTCyDY10FsFDDVgY1CN+NEEaM+fXppjzcMbpGcgbjPaAau6?=
 =?us-ascii?Q?QVNZZiy3Cjr3QgYY/WcNm5ERjoahG1XuHnj+f0P+AfP7GB5PHLrTBOj7J5Qd?=
 =?us-ascii?Q?i1H6UdRVcOSXLzpudSptGV/f8fbQB6pqU8OUx3LQFje2PRCX/7tGV6PhigOr?=
 =?us-ascii?Q?5BeMUbUP1exOzkpXqLzw6k1ilK0XV4bAP952u/SUbDalSIFaxBlGroZ9ibTC?=
 =?us-ascii?Q?sIOkdJd5trfbq37w/YvSiRK8GNcybnimhudyjFXLvI/TpWJQnMR5EyjpOMpf?=
 =?us-ascii?Q?ln+Ix9Wfg5j1OzpJp4DKkRxJ/xeOqnz/AMjlL1WDpUaFU++A/uWrLXOCScdF?=
 =?us-ascii?Q?6hQFeDHYWum/vjB/3YvlLsCvutbSNaNuDkX4DGbmRb59uBZU/BrAPYaJluZH?=
 =?us-ascii?Q?1OvLDGAL0XHOjFvpG7HuM7OgD0BUQ5H58lUOaALA3m2sCx5+OTTmt0j+Vz11?=
 =?us-ascii?Q?6BTqW2xityU7vrFK?=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025; 
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to       
 :cc;        bh=/XG8wGMoyUv6lYKMyZk/b63prTSeiN7OqjwfzhXPeBU=;       
 b=mZTMp25p5tZ0QS0QQn2WdAs83YNBwqRMFSxTq86nFaKIOCf6chuWTaKlENsao9OeDa        
 CgKnDADSE7Dx8ODu0JgVhrgWjnRKMJ8mLWF8hwOvWD1fTLSGiLKWDozvjerIiL8V3Ggr        
 5OTCrQ+ZGZUaMshEx0AyLZjb3p5dwvfgKoTZMynJGZHvgMuW74cqgCYYF4gZuClipIAM        
 Pf7+SfYjBr3ipQG9Znp04j3nKycyUWT6604f5EZRVDocOU441jop29clCIKCU6wIbhLK        
 Mt1OomC3eSIhfyaEWnQcS2UPXs4KhsBEJnGw1+YGgowp/9LnB1Pu+IEu0ednFtBwIGyD        
 goEA==
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 128.138.128.233) smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=pass (signature was verified)
 header.d=gmail.com;o365.colorado.edu; dmarc=pass action=none
 header.from=gmail.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgODozNiBQTSBT
dGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6Cj4KPiBIaSBhbGws
Cj4KPiBBZnRlciBtZXJnaW5nIHRoZSBkcm0tbWlzYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQg
YnVpbGQgKHg4Nl82NAo+IGFsbG1vZGNvbmZpZykgZmFpbGVkIGxpa2UgdGhpczoKPgo+IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2Zk
X21vZHVsZS5jOjI1Ogo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGtmZC9rZmRf
cHJpdi5oOjQwOjEwOiBmYXRhbCBlcnJvcjogZHJtL2RybVAuaDogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQo+ICAgIDQwIHwgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gICAgICAgfCAgICAgICAg
ICBefn5+fn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9jaGFyZGV2LmM6Mzg6Cj4gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9wcml2Lmg6NDA6MTA6IGZhdGFsIGVycm9yOiBkcm0vZHJt
UC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgNDAgfCAjaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KPiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fgo+IEluIGZpbGUgaW5jbHVkZWQg
ZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2ZkX2RldmljZS5jOjI2
Ogo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGtmZC9rZmRfcHJpdi5oOjQwOjEw
OiBmYXRhbCBlcnJvcjogZHJtL2RybVAuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAg
IDQwIHwgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+
fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
YW1ka2ZkL2tmZF90b3BvbG9neS5jOjM0Ogo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2FtZGtmZC9rZmRfcHJpdi5oOjQwOjEwOiBmYXRhbCBlcnJvcjogZHJtL2RybVAuaDogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgIDQwIHwgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gICAg
ICAgfCAgICAgICAgICBefn5+fn5+fn5+fn4KPgo+Cj4gQ2F1c2VkIGJ5IGNvbW1pdAo+Cj4gICA0
ZTk4Zjg3MWJjZmYgKCJkcm06IGRlbGV0ZSBkcm1QLmggKyBkcm1fb3NfbGludXguaCIpCj4KPiBp
bnRlcmFjdGluZyB3aXRoIGNvbW1pdAo+Cj4gICA2Yjg1NWY3YjgzZDIgKCJkcm0vYW1ka2ZkOiBD
aGVjayBhZ2FpbnN0IGRldmljZSBjZ3JvdXAiKQo+Cj4gZnJvbSB0aGUgYW1kZ3B1IHRyZWUuCj4K
PiBJIGFkZGVkIHRoZSBmb2xsb3dpbmcgbWVyZ2UgZml4IHBhdGNoIGZvciB0b2RheToKPgo+IEZy
b206IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IERhdGU6IFdlZCwg
OSBPY3QgMjAxOSAxMToyNDozOCArMTEwMAo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGtmZDog
dXBkYXRlIGZvciBkcm1QLmggcmVtb3ZhbAo+Cj4gU2lnbmVkLW9mZi1ieTogU3RlcGhlbiBSb3Ro
d2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9wcml2LmggfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJp
di5oCj4gaW5kZXggYjhiNDQ4NWM4Zjc0Li40MWJjMDQyOGJmYzAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKPiBAQCAtMzcsNyArMzcsOSBAQAo+ICAjaW5jbHVkZSA8
bGludXgva3JlZi5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L2RldmljZV9jZ3JvdXAuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gKyNpbmNsdWRl
IDxkcm0vZHJtX2ZpbGUuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+Cj4gKyNpbmNsdWRl
IDxkcm0vZHJtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8a2dkX2tmZF9pbnRlcmZhY2UuaD4KPgo+
ICAjaW5jbHVkZSAiYW1kX3NoYXJlZC5oIgo+IEBAIC00OSw4ICs1MSw2IEBACj4gIC8qIEdQVSBJ
RCBoYXNoIHdpZHRoIGluIGJpdHMgKi8KPiAgI2RlZmluZSBLRkRfR1BVX0lEX0hBU0hfV0lEVEgg
MTYKPgo+IC1zdHJ1Y3QgZHJtX2RldmljZTsKPiAtCj4gIC8qIFVzZSB1cHBlciBiaXRzIG9mIG1t
YXAgb2Zmc2V0IHRvIHN0b3JlIEtGRCBkcml2ZXIgc3BlY2lmaWMgaW5mb3JtYXRpb24uCj4gICAq
IEJJVFNbNjM6NjJdIC0gRW5jb2RlIE1NQVAgdHlwZQo+ICAgKiBCSVRTWzYxOjQ2XSAtIEVuY29k
ZSBncHVfaWQuIFRvIGlkZW50aWZ5IHRvIHdoaWNoIEdQVSB0aGUgb2Zmc2V0IGJlbG9uZ3MgdG8K
PiAtLQo+IDIuMjMuMAo+Cj4gLS0KPiBDaGVlcnMsCj4gU3RlcGhlbiBSb3Rod2VsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
