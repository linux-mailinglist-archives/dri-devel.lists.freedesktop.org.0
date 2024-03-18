Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779387FA8D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B782810F8E4;
	Tue, 19 Mar 2024 09:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9A110F8D9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:14:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5529749"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208,217";a="5529749"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782083"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
 d="scan'208,217";a="827782083"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:14:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:14:47 +0200
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Tue, 19 Mar 2024 11:14:47 +0200
Resent-Message-ID: <ZflXhxiwcKzYMNEm@intel.com>
Resent-To: dri-devel@lists.freedesktop.org
X-Original-To: ville.syrjala@linux.intel.com
Delivered-To: ville.syrjala@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by stinkbox.stink.local with IMAP (fetchmail-6.4.37)
 for <vsyrjala@localhost> (single-drop); Tue, 19 Mar 2024 01:38:37 +0200 (EET)
Received: from orviesa008.jf.intel.com (ORVIESA008.jf.intel.com
 [10.64.159.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 38A92580E3B
 for <ville.syrjala@linux.intel.com>; Mon, 18 Mar 2024 16:37:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208,217";a="14268771"
Received: from fmvoesa104.fm.intel.com ([10.64.2.14])
 by orviesa008-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 16:37:03 -0700
IronPort-SDR: 65f8d01d_3aSmTnnt8m2TCPMpwP/I39X0fOv0DX6YEG1mPV/BwxQUBNL
 RWlSW3dcgb9m0HpIpOOhnPbG5a1qgj38iKvDYtA==
X-IPAS-Result: =?us-ascii?q?A0ELAAD3zvhlmLHS/INaHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBgzRWQUiEVogdX4hrGX2SAYZthAaBbgMNDwEBAQEBAQEBAQkuAQ4EA?=
 =?us-ascii?q?QIEAQEDBIR5BAICiAMCJjQJDQEBAgQBAQEBAwIBAgEBAQEBAQgBAQECAgEBA?=
 =?us-ascii?q?QIBAQYDAQEBAQIQAQEBAQEBAQEeGQUQDieFbA2CXAGBHoEmAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBHQINewIBAwEiBCAyEE0CAicvBhODAAGCXwMFDAa0NH8zgQGCTYETAYEAr?=
 =?us-ascii?q?lGBaoFIAYFfhkYBgVICAoNdhH4nDg2BSEWBFTIBgQiBN3aCShcDhTqCaASBF?=
 =?us-ascii?q?H+DEgMmg2uFCY0BQYFdgRWFHAcHY1wiA30IaxsQHhIlERATDQMIbh0CMToDB?=
 =?us-ascii?q?QMEMgoSDAsfBRJCA0MGSQsDAhoFAwMEgS4FDRoCECwmAwMSSQIQFAMbHQMDB?=
 =?us-ascii?q?gMKMTBVQQxQA2QfMgk8CwQMGgIbFA0kIwIsPgMJChACFgMdFgQwEQkLBx8DK?=
 =?us-ascii?q?gY2AhIMBgYGXSAWCQQlAwgEAxBCAyByEQMEGgQLBzo5BYFKgW0BAgQBAwESA?=
 =?us-ascii?q?UcQK4EIAYoig0IqAYF2glUDMxEdNwkDC209NQgMGygmQx0SoUV6AYFqgSQyI?=
 =?us-ascii?q?TQCImEdgT4IklMaOIMri2yBNKEUO4QcgW2CD4gOjSuIPxMDg2+BVoFHiV+ZL?=
 =?us-ascii?q?S6YMYltCoEkXoEsS5VRJoUVNYEvOoFHDgdNMIEFBlY7gQ4JRgMZD445iHWKZ?=
 =?us-ascii?q?UM1AjkCBwEKAQEDCQGBKIQRDAEBIYM5al0BAQ?=
IronPort-PHdr: A9a23:FgyiQBUUT/yqcaTsw2dx/6U3UT/V8KzkUjF92vMcY1JmTK2v8tzYM
 VDF4r011RmVB9Sdu6IP07uempujcFJDyK7CikxKSIZLWR4BhJdetC0bK+nBN3fGKuX3ZTcxB
 sVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBxrwKxd+KPjrFY7OlcS30P2594HObwlSizexf7d/I
 A+1oAjSucUanY9vIbstxxXUpXdFZ+tZyWR0KFyJmBry+tm+94N5/SRKvPIh+c9AUaHkcKk9U
 LdVEjcoPX0r6cPyrRXMQheB6XUaUmUNjxpHGBPF4w3gXpfwqST1qOxw0zSHMMLsTLA0XTOi7
 7p3SBLtlSwKOSI1/H3Rh8dtl69Qvg6vqAJjzI7VeIGVNeRxfqXBfdMBWGFNWt9dWzFdDo+ga
 ocCCfcKM+RFoInnv1YBsRSxCxSsCu3x1DJGiHz43aM43OQ7CgzJxhAsEsgUvXjIsNn4NqEfW
 v21wqnSyjXDautb1y3n54jUbh8hof+NXbVqccrS1EIiEBvFgU+MqYP5PzOU2OMNs3KY7+d7S
 +2vjnAoqxtwojir3MsshJPJiZwLxV/Z6yp524U1JcG/SE5je9KkF4FQty6DOoZwX8gtTH1mt
 jwgxb0apZ60YjIKyJI/yhPeaPGKbYaF7xbnWeufPDp1hm9pdK69ihus7UStyfHwW9ep3FtFs
 yZIk9bCu34T2xHc98WKSfhw8Eej1DuR1w7e7PxPL04zlareMZEhw7gwm4IdsUTZACD5hlj5g
 7GNdkUn5uio7Pznbq/hpp+GOI94kh3yPrk0lsy4G+Q4PQ4DVHWY9+SkzLDv4EP0TKhQgvEok
 qTVrorWKdoGqqKlGQNZz4Qu5hSnAzu73tkUgGMLIExFdR6ZlYTlJUzCLOziAfuiglmhkjFmz
 O3YM73lH5XNNWTDn6n7fbhg6k5dyRQ8wMhD659SF7oPOuj8WlXru9zdFhI5MxK7w+LgCNhl2
 YMRQ3mADbGDPKPcq1+H+PwgLPSSa48Ouzb9N/8l5+b0gX8+g18dcrGl3ZoRaH+mAvRrO1iVb
 HTxjtsbD2sHvhQyQPb0hFGfTTJffWu+UqA+6z0jDYKpF4bDRoSjgLyb2ye7G4VbZnhcBVCQD
 Xjod4uFW/AWaCKROcJujDkEWqa7S48g0RGirgH6y6B5IeXK5yIXq4nj1Ntp5+3UjRE+7zt0D
 96S022VSWF7hXsHRyUq06BnvUx91lCD3LBlj/BAD9xc++tJUhsmNZ7b1+F6FdHyWgbFftiXU
 lqmWdWnASszTt0rx98BeV1wG9GjjhDFwiqrDKUZl72NBJwo7K3c22L9KNp6y3bDh+EdiAwYQ
 89LOCWdl7R9ewxfT9rXkkGdmuCxZL4e1SrE3GOCy3ee+kBeTAN0F67CWCZMXEbOqcXF4RbDS
 aOjDfEoPBtpzc+ZNrAMZMfkgFlLX/T/P8yYZHi+yEmqAhPd/rqQZ4r1fH8elHHFAVQPkx8U5
 3WuOA0zHCal5WzEATFiGEnsf0T0t+5kpyXoHQcP0wiWYhg5hPKO8RkPiKnZEqtLto8=
IronPort-Data: A9a23:k2Z2mq6ZbrR55jgibwuWAQxRtNLMchMFZxGqfqrLsTDasY5as4F+v
 jEXUGCHbq6OZTCnf9t+a9ixpxlU65+Gn9YyTAY5qig3Eysa+MHILOrCEkqhZCn6wu8v7a5EA
 2fyTvGZdJhcoqr0/0/1WlTHhScijfngqp3UUbecY38ZqTdMEXtn01Q58wIAqtQAqcCjBA+Qs
 s/FrcTaOVu0sxZ5KWt8B5ir8XuDh9ys/mtH1rACTaoT5gOGzCBFVMh3yZyZdhMUfKEFRoZWe
 M6elNlVzkuBlz8xB9WslKrMc0FiatY+6iDV0hK684D76vRzjnRaPpQTbZLwWm8O49m9pO2d/
 f0W3XCGYVxwYvCTwrR1vy5wSEmSNYUekFPOzOPWXca7lyUqeFO1qxli4dpf0ST1NY+bDEkXn
 cH0JgzhYTiC29CcnreYYNJwqdV+J83Pe7Ewo3tvmGSx4fYOGfgvQo3F7NVVmjkqi81CEO3de
 80BLz11Y3wsYTUWYQ5RUs9k2r3x3j+mLGIwRFG9/cLb50DLxRB60KfqKtn9d9mHX8RR2EiCq
 2/K8n/6HhYCctuFxlJp91r12beTzXqnBur+EpWh6N83nmyV1FYZUjcyWQKk8fSQtGyhDoc3x
 0s8o3Zx/PlrnKCxdfHjXhm8rTifrwQeUt5ZO+k77hydjKvS/wudQGMDS1Z8hMcOu8Y8SHokz
 FKEk97yBiBoqPuSU331GqqoQS2aOHQnBzEHRgU/USQUvtLnhMYBoQvFQYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5lXG3ia21pAQbCUFGYIChXrY46z0u9uiGeYi2GA5lHR4LBONouUQlSav
 2QDg46Z9u9m4XCxeM6lEL5l8FKBvqjt3NjgbbhHQsFJG9OFpiTLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUptzlfewS4u7Cq+MP7Kih6SdkifapEmCgmbNhQjQfLQEy8nTx
 L/FLJv3Ux7294w7kVJauNvxIZdymn9vlDq7qWHT1xO9zb6XYnLdUqsMLFbGc+Y48q6euwTJ4
 r5i2ziilX1ivBnFSnCPq+Y7dAlSRVBiXMCeg5IMLIarfFE5cFzN/teMm9vNjaQ/wfQM/goJl
 1ngMnJlJK3X2iyacV7VOy0+AF4tNL4mxU8G0eUXFQ7A8xAejUyHts/zrrNuJuB7pt9wh+V5V
 ecEcMimC/FCAGaPsTcEYJW36MQoeB23jEjcd2CocRouTa5GHgbpw97Dehew1S8sCiHsi9Ayj
 Yf93SzmQL0CZT9YMuDoVNyVwWmM4EctwNBJYxOQI/14Wlndz4xxGimg0t41O54tLDvA9Bu71
 iGXIxMSmtfcqrAq7evPp6S2kL2tGLFiRkABNnTRtpSwFCjF/1iMxZ1Lf/aIcAv8CkL12vSGT
 sdEw87sNMYomA5xjLN9NLJw3IQ8zdfLjJ1L/DRORXnkQQyiNeJ9HyOgw8JKiJxo+pZYngmHA
 mS05dhQPOSyCvPPSVI+ClIsUbWe6KsyhDLX0PUSJXf67g9R+J6scx1bHzuIuRxnAIpFCqEX6
 sZ/h5dO8C26sAQgDfiehCMN92isEG0JY596ir4kWr3UmigZ4XAcR6fDCx3GwoCFMPRNFUgIH
 gW6poT/g5Zk+06TVEZrSFbs27JGiIUsqSJ66gYIB260l+rvgt412xxs8goLcDlF8yUf08xPF
 zhqE2ZXOZSx+yxZgZkffmK0RCBEKh6r2m3w7ForklzmbU2MU17cHlIDOtS92loV3DNDWj0K7
 YOJ6X3EVAzyd5rbxRoCWk9Cqt3iQ+du9wbEptuVIsSdE7Q+YhvnmqWLd0NRjzfGWOQam1zhp
 8Nm2M1SeJ/LH3ccjINjArbLyIlKbg6PIVJzZM1I/YQLLDn6Qy6z0z3fEHKBUJpBCNKS+HDpF
 vE0ANxEUim/8yO8rjo7
IronPort-HdrOrdr: A9a23:Hbeoo6qrsvo7WpV3jkcyCFoaV5oWeYIsimQD101hICG9vPb4qy
 nOpp4mPHDP6Ar5NEtOpTnEAtjlfZq+z/NICOsqTNSftWDd0QPCEGgh1/qG/9SHIVyYygc378
 tdmsZFZuHYPBxChdvx4Re/CNRl4dmB7cmT9IXj80s=
X-Talos-CUID: 9a23:HYZWSWFjf/ISnbk5qmJmqHw+RMUGWEbB42aNKEucTlRGUbeaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AbUZrBg0xX0ahqTkMc6m8A8lx2jUj+rqPVV48l4c?=
 =?us-ascii?q?8sZOuESApJGeQpQqVXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17048146"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208,217";a="17048146"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 16:37:01 -0700
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F7F10EC15;
 Mon, 18 Mar 2024 23:37:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9069664918230728638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_drm=3A_Add_plane_SIZE=5FHIN?=
 =?utf-8?q?TS_property_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 18 Mar 2024 23:37:01 -0000
Message-ID: <171080502136.900325.14939729936122110471@8e613ede5ea5>
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

--===============9069664918230728638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Add plane SIZE_HINTS property (rev6)
URL   : https://patchwork.freedesktop.org/series/113758/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14443 -> Patchwork_113758v6
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_113758v6 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_113758v6, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/index.html

Participating hosts (35 -> 34)
------------------------------

  Additional (2): bat-arls-4 bat-jsl-1 
  Missing    (3): bat-kbl-2 bat-dg2-11 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_113758v6:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@slpc:
    - bat-arls-1:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-arls-1/igt@i915_selftest@live@slpc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-arls-1/igt@i915_selftest@live@slpc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14443 and Patchwork_113758v6:

### New IGT tests (23) ###

  * igt@kms_cursor_crc@cursor-size-hints:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.42, 0.51] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.56] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.66, 0.83] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.29, 0.74] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.52, 0.81] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.29, 0.84] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-b-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.68] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.51, 0.56] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.40, 1.47] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.27, 0.35] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-c-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.54] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.40] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.34] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.67] s

  

Known issues
------------

  Here are the changes found in Patchwork_113758v6 that come from known issues:

### CI changes ###

#### Possible fixes ####

  * boot:
    - fi-cfl-8109u:       [FAIL][3] ([i915#8293]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/fi-cfl-8109u/boot.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-cfl-8109u/boot.html

  

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#9318])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][6] ([i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-jsl-1:          NOTRUN -> [SKIP][8] ([i915#4613]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][9] ([i915#4613]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-arls-1:         [PASS][10] -> [DMESG-FAIL][11] ([i915#10262]) +3 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-arls-1/igt@i915_selftest@live@guc_multi_lrc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-arls-1/igt@i915_selftest@live@guc_multi_lrc.html

  * {igt@kms_cursor_crc@cursor-size-hints} (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][12] ([i915#9197])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-dg2-8/igt@kms_cursor_crc@cursor-size-hints.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-kbl-guc/igt@kms_cursor_crc@cursor-size-hints.html
    - bat-adlm-1:         NOTRUN -> [SKIP][14] ([i915#9900])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-adlm-1/igt@kms_cursor_crc@cursor-size-hints.html
    - bat-dg2-9:          NOTRUN -> [SKIP][15] ([i915#9197])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-dg2-9/igt@kms_cursor_crc@cursor-size-hints.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-kbl-x1275/igt@kms_cursor_crc@cursor-size-hints.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-kbl-8809g/igt@kms_cursor_crc@cursor-size-hints.html
    - bat-atsm-1:         NOTRUN -> [SKIP][18] ([i915#6078])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-atsm-1/igt@kms_cursor_crc@cursor-size-hints.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][19] ([i915#4103]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][20] +11 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-cfl-8109u/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9886])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-1:          NOTRUN -> [SKIP][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][23] ([i915#3555])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-apl-guc:         [ABORT][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/fi-apl-guc/igt@i915_selftest@live@gem_contexts.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-apl-guc/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-6:         [ABORT][26] ([i915#10021]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-adlp-6/igt@i915_selftest@live@hangcheck.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-adlp-6/igt@i915_selftest@live@hangcheck.html
    - bat-rpls-3:         [DMESG-WARN][28] ([i915#5591]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10021]: https://gitlab.freedesktop.org/drm/intel/issues/10021
  [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
  [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
  [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#10262]: https://gitlab.freedesktop.org/drm/intel/issues/10262
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#8293]: https://gitlab.freedesktop.org/drm/intel/issues/8293
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
  [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900


Build changes
-------------

  * IGT: IGT_7769 -> IGTPW_10848
  * Linux: CI_DRM_14443 -> Patchwork_113758v6

  CI-20190529: 20190529
  CI_DRM_14443: ce8cc731d53f9197a853b0d00386d7835f2b80e6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10848: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html
  IGT_7769: 7769
  Patchwork_113758v6: ce8cc731d53f9197a853b0d00386d7835f2b80e6 @ git://anongit.freedesktop.org/gfx-ci/linux


### Linux commits

3ebe7f36efb4 drm/i915: Add SIZE_HINTS property for cursors
90a85e9601b4 drm: Introduce plane SIZE_HINTS property

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/index.html

--===============9069664918230728638==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm: Add plane SIZE_HINTS property (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113758/">https://patchwork.freedesktop.org/series/113758/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14443 -&gt; Patchwork_113758v6</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_113758v6 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_113758v6, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/index.html</p>
<h2>Participating hosts (35 -&gt; 34)</h2>
<p>Additional (2): bat-arls-4 bat-jsl-1 <br />
  Missing    (3): bat-kbl-2 bat-dg2-11 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_113758v6:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-arls-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-arls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14443 and Patchwork_113758v6:</p>
<h3>New IGT tests (23)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.42, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.66, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.29, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.52, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.29, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.51, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.40, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.27, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.67] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_113758v6 that come from known issues:</p>
<h3>CI changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>boot:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/fi-cfl-8109u/boot.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8293">i915#8293</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-cfl-8109u/boot.html">PASS</a></li>
</ul>
</li>
</ul>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-arls-1/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-arls-1/igt@i915_selftest@live@guc_multi_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10262">i915#10262</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-size-hints} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-dg2-8/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-kbl-guc/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-adlm-1/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-dg2-9/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-kbl-x1275/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-kbl-8809g/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a></li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-atsm-1/igt@kms_cursor_crc@cursor-size-hints.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-cfl-8109u/igt@kms_dsc@dsc-basic.html">SKIP</a> +11 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/fi-apl-guc/igt@i915_selftest@live@gem_contexts.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/fi-apl-guc/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-adlp-6/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10021">i915#10021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-adlp-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113758v6/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7769 -&gt; IGTPW_10848</li>
<li>Linux: CI_DRM_14443 -&gt; Patchwork_113758v6</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14443: ce8cc731d53f9197a853b0d00386d7835f2b80e6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10848: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10848/index.html<br />
  IGT_7769: 7769<br />
  Patchwork_113758v6: ce8cc731d53f9197a853b0d00386d7835f2b80e6 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<h3>Linux commits</h3>
<p>3ebe7f36efb4 drm/i915: Add SIZE_HINTS property for cursors<br />
90a85e9601b4 drm: Introduce plane SIZE_HINTS property</p>

</body>
</html>

--===============9069664918230728638==--
