Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C4D87FA89
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3629710F8E0;
	Tue, 19 Mar 2024 09:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931F810F8E3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:14:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5529744"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5529744"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:14:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782082"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="827782082"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:14:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:14:44 +0200
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Tue, 19 Mar 2024 11:14:44 +0200
Resent-Message-ID: <ZflXhCo-Cm6NBHlO@intel.com>
Resent-To: dri-devel@lists.freedesktop.org
X-Original-To: ville.syrjala@linux.intel.com
Delivered-To: ville.syrjala@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by stinkbox.stink.local with IMAP (fetchmail-6.4.37)
 for <vsyrjala@localhost> (single-drop); Tue, 19 Mar 2024 01:23:09 +0200 (EET)
Received: from fmviesa003.fm.intel.com (fmviesa003.fm.intel.com
 [10.60.135.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 596FB580E3B
 for <ville.syrjala@linux.intel.com>; Mon, 18 Mar 2024 16:19:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18196320"
Received: from fmvoesa106.fm.intel.com ([10.64.2.16])
 by fmviesa003-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 16:19:25 -0700
IronPort-SDR: 65f8cbed_hw8+LtjQRwgouvH5FZxK2gi58ViPE6dLIihvH86Dvp1Uer8
 ils222Vf/ElVvwW6NRb2enzNw0WGHrAoOW8P/Ww==
X-IPAS-Result: =?us-ascii?q?A0F1AQCGy/hlmLHS/INagQmFBFZBhR6DT4UtiEc9n28PA?=
 =?us-ascii?q?QEBAQEBAQEBCTkIAQIEAQEDBIR5BAICiAMCJjgTAQIEAQEBAQMCAQIBAQEBA?=
 =?us-ascii?q?QEIAQEBAgIBAQECAQEGAwEBAQECEAEBAQEBAQEBHhkFEA4nhWwNglwBgR6BJ?=
 =?us-ascii?q?gEBAQEBAQEBAQEBAR0CDXsCAQMjVhAlAiYCAkYQBoMTAYJfAwUMtEaBMoEBg?=
 =?us-ascii?q?2ABgQCuUYFkBoEaLogmAYFWg12EficODYFIRYFHAYM1HogAgmgEghODO4Nrj?=
 =?us-ascii?q?1+KeQcCBWNiHAOBBWsbEB4SJREQEw0DCG4dAjE6AwUDBDIKEgwLHwUSQgNDB?=
 =?us-ascii?q?kkLAwIaBQMDBIEuBQ0aAhAsJgMDEkkCEBQDGx0DAwYDCjEwVUEMUANkHzIJP?=
 =?us-ascii?q?AsEDBoCGxQNJCMCLD4DCQoQAhYDHRYEMBEJCwcfAyoGNgISDAYGBl0gFgkEJ?=
 =?us-ascii?q?QMIBAMQQgMgchEDBBoECwc6OQWBSoFtAQYBAwESAUYBDQMrgQgBiiKDQioBg?=
 =?us-ascii?q?XaCVAMzER03CQMLbT01CAwbKB4IQx0Soj4Bg1g/lTkJg3SNIIIbnnk7hByBb?=
 =?us-ascii?q?YIPiA6VahMDg1wBgy+jDC6YMY1wlXeFFTWBRiOBXE0wgQUGVjuBD04DGQ+OO?=
 =?us-ascii?q?Yh1imVDcAIHAQoBAQMJAYEohBEMAQEhgzmBRwEB?=
IronPort-PHdr: A9a23:7hRchR/SOuWEjP9uWS+7ngc9DxPPW53KNwIYoqAql6hJOvz6uci4b
 QqPtb413BfgZsby1bFts6nsj+jYQ2sO4JKM4jgpUadncFs7s/gQhBEqG8WfCEf2f7bAZi0+G
 9leBhc+pynoeUdaF9zjaFLMv3a88SAdGgnlNQpyO+/5BpPeg9642uys/5DfeQZFiTmybb9uL
 xi9sBncuNQRjYZ+Jak9zQfErGFPd+pK221jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q
 6VAADspL2466svrtQLeTQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUjms8
 6tnVBnlgzocOjUn7G/YlNB/jKNDoBKguRN/xZLUYJqIP/Z6Z6/RYM8WSXZEUstXSidPAJ6zb
 5EXAuUdMulWoJTzqVsQoxagCweiB+3vxT1ShnLtwa030f4sHR3a0AA8Hd8DtmnfotXvNKcVV
 OC41LPGwi/fb/xK2Tf85o/IcgoiofqRWr9wadDeyVUzGAPFgFSQrpblPzCO2+sTtmiU8fBgV
 eOri2I9pQFxuCagydkxhYbXnYIVyUzE9SJhwIovIt24UkF7bMeiHZBNuC6UK5F4Tdk+Q2F0p
 ik60LsGtIamcSYKx5kqyB7RZvOIfoaI7R/vSOafLCpmiX57dr+ymwq//Ea9x+PzUsS50VlHo
 ylbntTRqHwByxPe59WHRPZz+EqqxDiB1wfW6u5eIEA0k7LWK5A7wrEuiJUcrFrMHjT1mEXqi
 6+Wbl8o+u+y6+ToZLjtu5ySN5dshw3jPKkih9azDfo4PwQQRWSX5/mw2KH58UHkQrhHjOU6n
 rTXvZzHP8gXuK60DxFP3oo99hqzEy2q3MkZkHQFKl9OZQyKj4z0O1HVPPD3E+2/jUmtkDZq2
 f/LJqHtD5PQJXbZirjhZ6xy60tExQoz099f45VUB6kOIP3pQUD+qsbUDhEjMwOq3enoFcty1
 pgdWWKTBa+ZKLnesViS5uIgO+WMZYkVtyjhK/U9+vLjg2I1lUUDcaSpw5cbcm60Eul6L0mDf
 HbhgNUMHX8PvgUkTezqjFOCUSRUZ3a3R688/is0CJ66AofDSIGth6aB3CSgE5JIY2BJFEqME
 Xbsd4meVfcMcjydLdF8nTMaTrihSJMh1Ra2tAPgzLpnNOXU9jUetZ34zNd1/fHclQku9TxoC
 MSQy3yBQ3lunmwUXz82wLx/oUtlx1ed0Kh4h/hYGsJJ6/NSUgY6L5zcwPZ+C9/oQQ/BetaJS
 FC7QtSpGz0xT9Qxw8MQbEZ5AdmtkhfD3y/5S4MSwoKKAJg5upnNxXp9I0o1n2jH0K0syUI3W
 MlGMWSOgq956hiVBojVnkHfnKGvI/cm0TbJ5VuEmGuIoExcFQF+QY3BXGsDfQ3Yt9n06k7ZT
 KOpEfIgKAQS59SFL/5yY8HijUpBXvSrbMzXf2mxhGCqBj6Fw76WbY6sdX8Q0SnQE0sYlBhV+
 myJY1ttThy9qn7TWWQ9XWnkZFnhpKwn8CvTcw==
IronPort-Data: A9a23:3VitL6IlOCi0ww5tFE+RO54lxSXFcZb7ZxGr2PjKsXjdYENS1DYFm
 GscUD3UbKmNZmLyfd1wYYjioB4O6sWAz4BrSFNorCE8RH9jl5H5CIXCJC8cHc8zwu4v7q5Dx
 5xGMrEs+ehtFie0SjGFbOa59RGQ8onRH+KlV4YoAggoGUk+Dn1JZStLwYYRmpRvjcWyHzSDs
 Nbzp9y3EFK+0laYCEpNg064gE0p5KuaVA8w5ARkOagQ5Q+GzRH5MbpGTU2PByqgKmVrNrPiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauWKVeQmoiM+t5mK2nCulARrukoIHKN0hXNsttm8t4sZJ
 ONl7sXsFFhzbsUgr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xSun3cBWJyCpaz5VGEV0r8fPI1Ay
 RAXABA2VT6Ipe+J+vXlbclGltQ/A/XnDoxK7xmMzRmBZRonaZ/KSaiM68VV0Ts9ncNSGu6YY
 NAWAdZtRE2bOlsVZw1RUstm2r732RETcBUAwL6RjbI+/2PT0wtr05DgNdfPe9jMS99Yk0qVv
 WHa+Hy/BQsVXDCa4WvZqy721rancSXTdp0pKv6h1PBWq3aJzXwRM0UHWEuqvqzs4qK5c4sDd
 B1Fo0LCt5Ma6k2vStS7RAyioneAtzYYWtxNA6s77h2Azuzf5APxO4QfZjFIYtFgutU7SDAnz
 VyVmMuvAiZg2FGIdZ6D3pevlh25GyUqFyhcQg8uXRsZzOXvko5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vYSgjiv3TEbfv3mjEm3TZcjPZ8Dk7SY5M0++UTIGsbYHu50LW4PpNN4WFSUHHu
 2IL8yR/0AzsJcHW/MBuaLxTdF1M2xpjGGCE6bKIN8R7nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYoOtruW5p1k/S/TYWNuhXogjxmP8AZmOivoXsGWKJs9zqFfLUEz/xiY
 snznTiEUSty5VtbIMqeHrtCgO5yrszP7XvUX4z/xhKrmaGCbWKYAaoDMUWDdPs48LLsnekm2
 4g3Cid+8D0GCLeWSnCOqeY7dAlaRVBlXsqeg5IMKYa+zv9ORTtJ5wn5m+1xIuSIXs19y4/1w
 51KchAJlQKk2iyadG1nqBlLMdvSYHq2llpjVQREALpi8yJ7CWp2xP5ELsdlTqpt7+F50/9/Q
 t8MfsjKULwFSS3K935ZJdPxpZBrPkbjzw+fHTuXUB5mdb5ZRivN5oDFeCnr/3IwFSaZj5Y1j
 ICh8QL5eqA9YTpeIvzYU9+V9GPpj0MhwLpze2DqPuhsfF7d9dk2Ci7p0d4yDcI+CTTC4Tq40
 wypPwYRmvbQkYkX9Ov2v6SP9ZvxGbBXA0ABPW/67Km3Bwbe7GGM0Y9Na8fWXDH/BUff2rSuW
 vVR9N74aMY4pVdtt5FtNbRBwYYVxcrdl5UDwitKRHz0PkmWUJV+KXy47Oxzn6xqxI4BnzCpW
 0iKq+JoCZ/QNOzLSFcudRcYNMKd3vQpmx7X3/Q/AGP+wARVpLOnc0FjDyOguRxnDoleEd0am
 L86mcss9QaApAIgMY+GggBq5m28FCE8fJt9hK4KIr3Aq1QN8U5DU6z+GyWtwZCoavdwCGcID
 AKQppL/g+V7+hKfXVs1TWPAzMhMt6Qo4Rpq9mIPF36Nu9jCh8I04iFvzCQKflxV4yhDgtlJB
 EJOCHNPHYSP4DZiu+ZbVU+OBQxqJUOU627x+XQzhUzbSEiieWjfIE0YJNSL3kQrzFhYdWJHp
 LvD4XvvChTsXcDu3xkdXVxuhOzjQOdQqCzDupGDNOaUE6YqZQHKhveVWlMJjB/8EOUzrkHjj
 st7ztZaMKHUG3YZnPwmNtO8y78VdiGhGEVDZvNQpIUyAmDWfWCJ6wikckyeVJtEGK3XzBWeF
 cdrG8NoUia+3gaoqhQw
IronPort-HdrOrdr: A9a23:opyZbKjsWYAbWRzevqnfdEtLvnBQXukji2hC6mlwRA09TyVXra
 CTdZMguSMc6Qx6ZJhOo6HiBEDtex3hHNtOkO4s1NSZMTUO2lHYTr2KhLGKq1bd8m/Fh4pgPM
 FbAs5D4bbLYmSS4/ya3CCIV+8p3dOH7qayh6P+z3BxJDsaDp1d0w==
X-Talos-CUID: 9a23:I3RgsmyRTaIsjwCSiUJuBgU0IfsLeV/Q802XfWiYI3Z5VJKpRW2frfY=
X-Talos-MUID: 9a23:KFrbZgbE8be27uBTmSDXunJ7FslUyI+0A1APqs0XttmVKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="9414281"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="9414281"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 16:19:09 -0700
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA6D10F213;
 Mon, 18 Mar 2024 23:19:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ESPARSE=3A_warning_for_drm=3A_Add_plane_SIZE=5F?=
 =?utf-8?q?HINTS_property_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 18 Mar 2024 23:19:08 -0000
Message-ID: <171080394889.900325.17010724228282199387@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
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
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm: Add plane SIZE_HINTS property (rev6)
URL   : https://patchwork.freedesktop.org/series/113758/
State : warning

== Summary ==

Error: dim sparse failed
Sparse version: v0.6.2
Fast mode used, each commit won't be checked separately.

