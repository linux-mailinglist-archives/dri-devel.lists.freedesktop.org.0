Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6399BCE45
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 14:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A25F10E0A3;
	Tue,  5 Nov 2024 13:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="Wo1dLc2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057A010E011
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 13:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730814746; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BTpws9Cc8Z6zvQyIreLOySedmtMA/PW/nJ3G5VVM6xkMxCgLVGno5ilsmT7SiNfWKElSK86EiZN0bJZcmJypJerd9hm0qPEzIl4wKi0VH9hdp5c8TR8XMf9geVpBRHj3ojyhX5oMUUnvvPBOFEPmTCMlOlA3cMKURHH9V6+CiLE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730814746;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=pidExZlKnV3OV7LOvKDA7sDf/W9lOxoRPhBb9T0W2cc=; 
 b=UtTqnlXNqnjiEfTaqaNXEyx1ZPmSuv02eM5f2u9E6hF9bV2tAEVkgAcig45OQUxwYpYXU3etIUPlm0qbrlvKrFudmXLpr35pfX5Y/3zRIZcTS77CXPBaiZ3XkrrwHUc+yn4IwkIrsjwccv1ZnNVl6G46/9u8kC6OaAOtDM/bfPw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730814746; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pidExZlKnV3OV7LOvKDA7sDf/W9lOxoRPhBb9T0W2cc=;
 b=Wo1dLc2aGRet3OsAfnG3U4+pC+v7K+qHJQGiFuaHajKzCvwU/SNZZdBf5w7VpMfV
 a3xvBqBR5WCOv+qoZ5JgJ07Mc3uyq2xST/1VEs7/IJKXQmi1nN4WWab9K0sOxk6o/AW
 1mjVZazA9RTej/fE+RW3Cs+HRNxe568h9EvDDumk=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1730814744807811.5268898687393;
 Tue, 5 Nov 2024 05:52:24 -0800 (PST)
Date: Tue, 05 Nov 2024 10:52:24 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "WangYuli" <wangyuli@uniontech.com>
Cc: "Vignesh Raman" <vignesh.raman@collabora.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <192fc99189e.1107f6fe127599.7164445195642331691@collabora.com>
In-Reply-To: <D47ADA30984AA8B6+6b0a7d79-3314-482a-8c0e-fcd1a9190571@uniontech.com>
References: <20241030091732.665428-1-vignesh.raman@collabora.com>
 <D47ADA30984AA8B6+6b0a7d79-3314-482a-8c0e-fcd1a9190571@uniontech.com>
Subject: Re: [PATCH v1] drm/ci: remove update-xfails.py
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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





---- On Thu, 31 Oct 2024 02:39:13 -0300 WangYuli  wrote ---

 > 
 > On 2024/10/30 17:17, Vignesh Raman wrote: 
 > > We can remove the xfails/update-xfails.py script as it is not 
 > > used in CI jobs. Once ci-collate [1] is tested for drm-ci, 
 > > we can use this tool directly to update fails and flakes. 
 > > 
 > > [1] https://gitlab.freedesktop.org/gfx-ci/ci-collate/ 
 > > 
 > > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com> 


Applied to drm-misc-next

Thanks
Helen

 > > --- 
 > >   drivers/gpu/drm/ci/xfails/requirements.txt |  17 -- 
 > >   drivers/gpu/drm/ci/xfails/update-xfails.py | 204 --------------------- 
 > >   2 files changed, 221 deletions(-) 
 > >   delete mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt 
 > >   delete mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py 
 > > 
 > > diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt 
 > > deleted file mode 100644 
 > > index 5e6d48d98e4e..000000000000 
 > > --- a/drivers/gpu/drm/ci/xfails/requirements.txt 
 > > +++ /dev/null 
 > > @@ -1,17 +0,0 @@ 
 > > -git+https://gitlab.freedesktop.org/gfx-ci/ci-collate@09e7142715c16f54344ddf97013331ba063b162b 
 > > -termcolor==2.3.0 
 > > - 
 > > -# ci-collate dependencies 
 > > -certifi==2023.7.22 
 > > -charset-normalizer==3.2.0 
 > > -idna==3.4 
 > > -pip==23.3 
 > > -python-gitlab==3.15.0 
 > > -requests==2.31.0 
 > > -requests-toolbelt==1.0.0 
 > > -ruamel.yaml==0.17.32 
 > > -ruamel.yaml.clib==0.2.7 
 > > -setuptools==70.0.0 
 > > -tenacity==8.2.3 
 > > -urllib3==2.0.7 
 > > -wheel==0.41.1 
 > > diff --git a/drivers/gpu/drm/ci/xfails/update-xfails.py b/drivers/gpu/drm/ci/xfails/update-xfails.py 
 > > deleted file mode 100755 
 > > index a446e98d72a1..000000000000 
 > > --- a/drivers/gpu/drm/ci/xfails/update-xfails.py 
 > > +++ /dev/null 
 > > @@ -1,204 +0,0 @@ 
 > > -#!/usr/bin/env python3 
 > > - 
 > > -import argparse 
 > > -from collections import defaultdict 
 > > -import difflib 
 > > -import os 
 > > -import re 
 > > -from glcollate import Collate 
 > > -from termcolor import colored 
 > > -from urllib.parse import urlparse 
 > > - 
 > > - 
 > > -def get_canonical_name(job_name): 
 > > -    return re.split(r" \d+/\d+", job_name)[0] 
 > > - 
 > > - 
 > > -def get_xfails_file_path(job_name, suffix): 
 > > -    canonical_name = get_canonical_name(job_name) 
 > > -    name = canonical_name.replace(":", "-") 
 > > -    script_dir = os.path.dirname(os.path.abspath(__file__)) 
 > > -    return os.path.join(script_dir, f"{name}-{suffix}.txt") 
 > > - 
 > > - 
 > > -def get_unit_test_name_and_results(unit_test): 
 > > -    if "Artifact results/failures.csv not found" in unit_test or '' == unit_test: 
 > > -        return None, None 
 > > -    unit_test_name, unit_test_result = unit_test.strip().split(",") 
 > > -    return unit_test_name, unit_test_result 
 > > - 
 > > - 
 > > -def read_file(file_path): 
 > > -    try: 
 > > -        with open(file_path, "r") as file: 
 > > -            f = file.readlines() 
 > > -            if len(f): 
 > > -                f[-1] = f[-1].strip() + "\n" 
 > > -            return f 
 > > -    except FileNotFoundError: 
 > > -        return [] 
 > > - 
 > > - 
 > > -def save_file(content, file_path): 
 > > -    # delete file is content is empty 
 > > -    if not content or not any(content): 
 > > -        if os.path.exists(file_path): 
 > > -            os.remove(file_path) 
 > > -        return 
 > > - 
 > > -    with open(file_path, "w") as file: 
 > > -        file.writelines(content) 
 > > - 
 > > - 
 > > -def is_test_present_on_file(file_content, unit_test_name): 
 > > -    return any(unit_test_name in line for line in file_content) 
 > > - 
 > > - 
 > > -def is_unit_test_present_in_other_jobs(unit_test, job_ids): 
 > > -    return all(unit_test in job_ids[job_id] for job_id in job_ids) 
 > > - 
 > > - 
 > > -def remove_unit_test_if_present(lines, unit_test_name): 
 > > -    if not is_test_present_on_file(lines, unit_test_name): 
 > > -        return 
 > > -    lines[:] = [line for line in lines if unit_test_name not in line] 
 > > - 
 > > - 
 > > -def add_unit_test_if_not_present(lines, unit_test_name, file_name): 
 > > -    # core_getversion is mandatory 
 > > -    if "core_getversion" in unit_test_name: 
 > > -        print("WARNING: core_getversion should pass, not adding it to", os.path.basename(file_name)) 
 > > -    elif all(unit_test_name not in line for line in lines): 
 > > -        lines.append(unit_test_name + "\n") 
 > > - 
 > > - 
 > > -def update_unit_test_result_in_fails_txt(fails_txt, unit_test): 
 > > -    unit_test_name, unit_test_result = get_unit_test_name_and_results(unit_test) 
 > > -    for i, line in enumerate(fails_txt): 
 > > -        if unit_test_name in line: 
 > > -            _, current_result = get_unit_test_name_and_results(line) 
 > > -            fails_txt[i] = unit_test + "\n" 
 > > -            return 
 > > - 
 > > - 
 > > -def add_unit_test_or_update_result_to_fails_if_present(fails_txt, unit_test, fails_txt_path): 
 > > -    unit_test_name, _ = get_unit_test_name_and_results(unit_test) 
 > > -    if not is_test_present_on_file(fails_txt, unit_test_name): 
 > > -        add_unit_test_if_not_present(fails_txt, unit_test, fails_txt_path) 
 > > -    # if it is present but not with the same result 
 > > -    elif not is_test_present_on_file(fails_txt, unit_test): 
 > > -        update_unit_test_result_in_fails_txt(fails_txt, unit_test) 
 > > - 
 > > - 
 > > -def split_unit_test_from_collate(xfails): 
 > > -    for job_name in xfails.keys(): 
 > > -        for job_id in xfails[job_name].copy().keys(): 
 > > -            if "not found" in xfails[job_name][job_id].content_as_str: 
 > > -                del xfails[job_name][job_id] 
 > > -                continue 
 > > -            xfails[job_name][job_id] = xfails[job_name][job_id].content_as_str.splitlines() 
 > > - 
 > > - 
 > > -def get_xfails_from_pipeline_url(pipeline_url): 
 > > -    parsed_url = urlparse(pipeline_url) 
 > > -    path_components = parsed_url.path.strip("/").split("/") 
 > > - 
 > > -    namespace = path_components[0] 
 > > -    project = path_components[1] 
 > > -    pipeline_id = path_components[-1] 
 > > - 
 > > -    print("Collating from:", namespace, project, pipeline_id) 
 > > -    xfails = ( 
 > > -        Collate(namespace=namespace, project=project) 
 > > -        .from_pipeline(pipeline_id) 
 > > -        .get_artifact("results/failures.csv") 
 > > -    ) 
 > > - 
 > > -    split_unit_test_from_collate(xfails) 
 > > -    return xfails 
 > > - 
 > > - 
 > > -def get_xfails_from_pipeline_urls(pipelines_urls): 
 > > -    xfails = defaultdict(dict) 
 > > - 
 > > -    for url in pipelines_urls: 
 > > -        new_xfails = get_xfails_from_pipeline_url(url) 
 > > -        for key in new_xfails: 
 > > -            xfails[key].update(new_xfails[key]) 
 > > - 
 > > -    return xfails 
 > > - 
 > > - 
 > > -def print_diff(old_content, new_content, file_name): 
 > > -    diff = difflib.unified_diff(old_content, new_content, lineterm="", fromfile=file_name, tofile=file_name) 
 > > -    diff = [colored(line, "green") if line.startswith("+") else 
 > > -            colored(line, "red") if line.startswith("-") else line for line in diff] 
 > > -    print("\n".join(diff[:3])) 
 > > -    print("".join(diff[3:])) 
 > > - 
 > > - 
 > > -def main(pipelines_urls, only_flakes): 
 > > -    xfails = get_xfails_from_pipeline_urls(pipelines_urls) 
 > > - 
 > > -    for job_name in xfails.keys(): 
 > > -        fails_txt_path = get_xfails_file_path(job_name, "fails") 
 > > -        flakes_txt_path = get_xfails_file_path(job_name, "flakes") 
 > > - 
 > > -        fails_txt = read_file(fails_txt_path) 
 > > -        flakes_txt = read_file(flakes_txt_path) 
 > > - 
 > > -        fails_txt_original = fails_txt.copy() 
 > > -        flakes_txt_original = flakes_txt.copy() 
 > > - 
 > > -        for job_id in xfails[job_name].keys(): 
 > > -            for unit_test in xfails[job_name][job_id]: 
 > > -                unit_test_name, unit_test_result = get_unit_test_name_and_results(unit_test) 
 > > - 
 > > -                if not unit_test_name: 
 > > -                    continue 
 > > - 
 > > -                if only_flakes: 
 > > -                    remove_unit_test_if_present(fails_txt, unit_test_name) 
 > > -                    add_unit_test_if_not_present(flakes_txt, unit_test_name, flakes_txt_path) 
 > > -                    continue 
 > > - 
 > > -                # drop it from flakes if it is present to analyze it again 
 > > -                remove_unit_test_if_present(flakes_txt, unit_test_name) 
 > > - 
 > > -                if unit_test_result == "UnexpectedPass": 
 > > -                    remove_unit_test_if_present(fails_txt, unit_test_name) 
 > > -                    # flake result 
 > > -                    if not is_unit_test_present_in_other_jobs(unit_test, xfails[job_name]): 
 > > -                        add_unit_test_if_not_present(flakes_txt, unit_test_name, flakes_txt_path) 
 > > -                    continue 
 > > - 
 > > -                # flake result 
 > > -                if not is_unit_test_present_in_other_jobs(unit_test, xfails[job_name]): 
 > > -                    remove_unit_test_if_present(fails_txt, unit_test_name) 
 > > -                    add_unit_test_if_not_present(flakes_txt, unit_test_name, flakes_txt_path) 
 > > -                    continue 
 > > - 
 > > -                # consistent result 
 > > -                add_unit_test_or_update_result_to_fails_if_present(fails_txt, unit_test, 
 > > -                                                                   fails_txt_path) 
 > > - 
 > > -        fails_txt.sort() 
 > > -        flakes_txt.sort() 
 > > - 
 > > -        if fails_txt != fails_txt_original: 
 > > -            save_file(fails_txt, fails_txt_path) 
 > > -            print_diff(fails_txt_original, fails_txt, os.path.basename(fails_txt_path)) 
 > > -        if flakes_txt != flakes_txt_original: 
 > > -            save_file(flakes_txt, flakes_txt_path) 
 > > -            print_diff(flakes_txt_original, flakes_txt, os.path.basename(flakes_txt_path)) 
 > > - 
 > > - 
 > > -if __name__ == "__main__": 
 > > -    parser = argparse.ArgumentParser(description="Update xfails from a given pipeline.") 
 > > -    parser.add_argument("pipeline_urls", nargs="+", type=str, help="URLs to the pipelines to analyze the failures.") 
 > > -    parser.add_argument("--only-flakes", action="store_true", help="Treat every detected failure as a flake, edit *-flakes.txt only.") 
 > > - 
 > > -    args = parser.parse_args() 
 > > - 
 > > -    main(args.pipeline_urls, args.only_flakes) 
 > > -    print("Done.") 
 >  
 > Reviewed-by: WangYuli wangyuli@uniontech.com> 
 >  
 > Cheers, 
 > -- 
 > WangYuli* 
 > * 
 > 

